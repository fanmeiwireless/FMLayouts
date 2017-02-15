//
//  UIView+FMLayouts.h
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FMLayoutAxis) {
    kFMLayoutAxisVertical = 0,
    kFMLayoutAxisHorizonal
};

@interface FMLayoutConfig : NSObject

// 小于0，则忽略
@property (nonatomic, assign) CGFloat fm_spacing;

@end

@interface UIView (FMLayouts)

@property (nonatomic, strong, readonly) FMLayoutConfig *layoutConfig;

#pragma mark - utils

- (void)reoffsetY:(CGFloat)offsetY ofView:(UIView *)view;
- (void)reoffsetX:(CGFloat)offsetX ofView:(UIView *)view;
- (void)resizeOffsetY:(CGFloat)offsetY height:(CGFloat)height ofView:(UIView *)view;
- (void)resizeOffsetX:(CGFloat)offsetX width:(CGFloat)width ofView:(UIView *)view;

@property (nonatomic, assign) CGFloat fm_x;
@property (nonatomic, assign) CGFloat fm_y;
@property (nonatomic, assign) CGFloat fm_centerX;
@property (nonatomic, assign) CGFloat fm_centerY;
@property (nonatomic, assign) CGFloat fm_height;
@property (nonatomic, assign) CGFloat fm_width;

@end
