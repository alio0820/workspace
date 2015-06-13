//
//  PhotoInfo.h
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
//Data model of picture

@interface PhotoInfo : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageURL;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;

@end
