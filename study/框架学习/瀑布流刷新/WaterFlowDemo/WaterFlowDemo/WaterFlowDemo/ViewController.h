//
//  ViewController.h
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoInfo.h"
#import "ASIHTTPRequest.h"

@interface ViewController : UIViewController
{
    ASIHTTPRequest *_request;
    UITextView *textView;
    UIImageView *imageView;
    BOOL _preBarHidden;
}

- (id)initWithInfo:(PhotoInfo *)info;

@end
