//
//  BSPhotoView.m
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import "BSPhotoView.h"

//缓存路径
#define PATH_TO_STORE_IMAGE [[NSHomeDirectory() stringByAppendingPathComponent:@"/Library"] stringByAppendingPathComponent:@"/Caches"]

@implementation BSPhotoView

- (void)dealloc
{
    [_request clearDelegatesAndCancel];
}

#pragma mark - Customs Methods
- (void)photoButtonPressed:(id)sender
{
    if (_delegate || [_delegate respondsToSelector:@selector(BSPhotoView:handleWithInfo:)]) {
        [_delegate BSPhotoView:self handleWithInfo:_info];
    }
}

#pragma mark - init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.0];
        
        _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _photoButton.exclusiveTouch = YES;
        [_photoButton addTarget:self action:@selector(photoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _photoButton.alpha = 1;
        [self addSubview:_photoButton];
        
        _lineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"waterflow_line.png"]];
        [self addSubview:_lineView];
        
        _momentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _momentLabel.backgroundColor = [UIColor clearColor];
        _momentLabel.font = [UIFont systemFontOfSize:12];
        _momentLabel.textColor = [UIColor colorWithRed:141/255.0 green:141/255.0 blue:141/255.0 alpha:1.0];
        _momentLabel.numberOfLines = 0;
        [self addSubview:_momentLabel];
    }
    return self;
}

- (void)appear
{
    if (_status == PhotoStatusNormal || _status == PhotoStatusDownloadFailed) {
        if (!_info.userImageURL || [_photoButton imageForState:UIControlStateNormal] != nil) {
            return;
        }
        _status = PhotoStatusDownloading;
        dispatch_async(_queue, ^{
            //do something
            @autoreleasepool {
                NSString *path = [PATH_TO_STORE_IMAGE stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", [[NSURL URLWithString:_info.userImageURL] lastPathComponent]]];
                UIImage *img = [UIImage imageWithContentsOfFile:path];//[[UIImage alloc] initWithContentsOfFile:path];
                
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    //回到主线程
                    if (img) {
                        _status = PhotoStatusDownloadFinished;
                        [_photoButton setImage:img forState:UIControlStateNormal];
                        _photoButton.alpha = 1;
                    }
                    else {
                        //开始下载图片                        
                        [_request clearDelegatesAndCancel];
                        _request = nil;
                        _request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:_info.userImageURL]];
                        [_request setDelegate:self];
                        [_request setDidFailSelector:@selector(loadFailed:)];
                        [_request setDidFinishSelector:@selector(loadFinish:)];
                        [_request startAsynchronous];
                    }
                });
                
            }
            
        });
    }
}

- (void)disappear
{
    _status = PhotoStatusNormal;
    [_photoButton setImage:nil forState:UIControlStateNormal];
    _photoButton.alpha = 0;
}

#pragma mark - ASIHTTPRequest Delegate
- (void)loadFinish:(ASIHTTPRequest *)request
{
    if (_status != PhotoStatusDownloading) {
        return;
    }
    _photoButton.alpha = 0;
    UIImage *image = [[UIImage alloc] initWithData:request.responseData];
    if (image) {
        NSString *path = [PATH_TO_STORE_IMAGE stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", [[NSURL URLWithString:_info.userImageURL] lastPathComponent]]];
        [request.responseData writeToFile:path atomically:NO];
        [_photoButton setImage:image forState:UIControlStateNormal];
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^(void) {
                             _photoButton.alpha = 1;
                         } completion:^(BOOL finished) {
                             
                         }];
    }
    _status = PhotoStatusDownloadFinished;
}

- (void)loadFailed:(ASIHTTPRequest *)request
{
    NSLog(@"下载图片失败, %@", request.error);
    _status = PhotoStatusDownloadFailed;
}

#pragma mark - Methods For Reuse
- (void)prepareForReuse
{
    if (_queue != NULL) {
        _queue = NULL;
    }
    [_request clearDelegatesAndCancel];
    [_photoButton setImage:nil forState:UIControlStateNormal];
    _momentLabel.text = nil;
    _status = PhotoStatusNormal;
    _info = nil;
}

- (void)fillViewWithObject:(PhotoInfo *)object
{
    _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _info = object;
    int image_h = 0;
    if (_info.height != 0) {
        image_h = (int)_info.height * 140/_info.width;
    }
    CGSize contentSize = [_info.userDescription sizeWithFont: [UIFont systemFontOfSize:12]
                                  constrainedToSize: CGSizeMake(140,MAXFLOAT)                                                                lineBreakMode: NSLineBreakByWordWrapping];
    _photoButton.frame = CGRectMake(3.5, 3.5, 140, image_h);
    _lineView.frame = CGRectMake(0, CGRectGetMaxY(_photoButton.frame) + 2, 147, 2);
    _photoButton.alpha = 0;
    if (_info.height == 0) {
        _lineView.hidden = YES;
    }
    else {
        _lineView.hidden = NO;
    }
    _momentLabel.frame = CGRectMake(4, CGRectGetMaxY(_lineView.frame) + 2, 140, contentSize.height);
    _momentLabel.text = _info.userDescription;
    
    if (_status != PhotoStatusDownloading) {
        [self appear];
    }
}

+ (CGFloat)heightForViewWithObject:(PhotoInfo *)object inColumnWidth:(CGFloat)columnWidth
{
    int image_h = 0;
    if (object.height != 0) {
        image_h = (int)object.height * 140/object.width;
    }
    CGSize contentSize = [object.userDescription sizeWithFont: [UIFont systemFontOfSize:12]
                                           constrainedToSize: CGSizeMake(140,MAXFLOAT)                                                                lineBreakMode: NSLineBreakByWordWrapping];
    //喜欢按钮的最低高度
    float content_h = contentSize.height;
    
    float view_h = 14 + image_h + content_h;
    return view_h;
}

@end
