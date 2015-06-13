//
//  RootViewController.h
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSPhotoWall.h"

@interface RootViewController : UIViewController<UIScrollViewDelegate,BSWaterViewDataSourse,BSPhotoViewDelegate>
{
@private
    BSPhotoWall *_photoWall;
    float _beginDrag;
    NSMutableArray *_dataArray;
    NSMutableArray *_idArray;
    BOOL _barHidden;
    BOOL _isEnterNextView;
}

@end
