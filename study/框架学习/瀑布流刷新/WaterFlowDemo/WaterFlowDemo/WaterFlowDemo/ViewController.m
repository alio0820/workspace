//
//  ViewController.m
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
//缓存路径
#define PATH_TO_STORE_IMAGE [[NSHomeDirectory() stringByAppendingPathComponent:@"/Library"] stringByAppendingPathComponent:@"/Caches"]
@interface ViewController ()
{
    PhotoInfo *_info;
}

@end

@implementation ViewController

- (void)dealloc
{
    imageView = nil;
    [[SDImageCache sharedImageCache] clearMemory];
}

- (id)initWithInfo:(PhotoInfo *)info
{
    self = [super init];
    if (self) {
        _info = info;
        _preBarHidden = self.navigationController.navigationBarHidden;
    }
    return self;
}

- (void)hiddenTextView:(UITapGestureRecognizer *)gesture
{
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [UIView animateWithDuration:0.3 animations:^{
            textView.alpha = 1;
            imageView.center = self.view.center;
        } completion:^(BOOL finished) {
            
        }];

    }
    else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [UIView animateWithDuration:0.3 animations:^{
            textView.alpha = 0;
            imageView.center = self.view.center;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = _info.userName;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 44)];
    NSLog(@"bounds = %@  frame = %@",NSStringFromCGRect(self.view.bounds) ,NSStringFromCGRect(self.view.frame));
    [imageView setImageWithURL:[NSURL URLWithString:_info.userImageURL] placeholderImage:nil options:SDWebImageProgressiveDownload success:^(UIImage *image) {
        
    } failure:^(NSError *error) {
        
    }];
    
    [self.view addSubview:imageView];
    imageView = nil;
    imageView.userInteractionEnabled = YES;
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(self.view.bounds)- 10 - 80, CGRectGetWidth(self.view.frame) - 20, 80)];
    textView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    textView.font = [UIFont boldSystemFontOfSize:14];
    textView.textColor = [UIColor whiteColor];
    textView.text = _info.userDescription;
    textView.editable = NO;
    [self.view addSubview:textView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTextView:)];
    [imageView addGestureRecognizer:tap];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
