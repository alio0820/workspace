//
//  BSPhotoView.h
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PhotoInfo.h"
#import "ASIHTTPRequest.h"

NS_ENUM(NSInteger, PhotoStatus) {
    PhotoStatusNormal,
    PhotoStatusDownloading,
    PhotoStatusDownloadFailed,
    PhotoStatusDownloadFinished
};

@class BSPhotoView;

@protocol BSPhotoViewDelegate <NSObject>

- (void)BSPhotoView:(BSPhotoView *)view handleWithInfo:(PhotoInfo *)info;

@end

@interface BSPhotoView : UIView
{
@private
    ASIHTTPRequest *_request;
    enum PhotoStatus _status;
    UIButton *_photoButton;
    UILabel *_momentLabel;
    UIImageView *_lineView;
    dispatch_queue_t _queue;
    PhotoInfo *_info;
}

@property (nonatomic, weak) id delegate;

- (void)appear;
- (void)disappear;

- (void)prepareForReuse;
- (void)fillViewWithObject:(PhotoInfo *)object;
+ (CGFloat)heightForViewWithObject:(PhotoInfo *)object inColumnWidth:(CGFloat)columnWidth;

@end
