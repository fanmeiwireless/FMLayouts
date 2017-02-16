//
//  UIView+FMLayoutsUtils.m
//  Fanmei
//
//  Created by 李传格 on 17/2/16.
//  Copyright © 2017年 Fanmei. All rights reserved.
//

#import "UIView+FMLayoutsUtils.h"

@implementation UIView (FMLayoutsUtils)

- (CGFloat)fm_x {
    return CGRectGetMinX(self.frame);
}

- (void)setFm_x:(CGFloat)fm_x {
    CGRect frame = self.frame;
    frame.origin.x = fm_x;
    self.frame = frame;
}

- (CGFloat)fm_y {
    return CGRectGetMinY(self.frame);
}

- (void)setFm_y:(CGFloat)fm_y {
    CGRect frame = self.frame;
    frame.origin.y = fm_y;
    self.frame = frame;
}

- (CGFloat)fm_centerX {
    return self.center.x;
}

- (void)setFm_centerX:(CGFloat)fm_centerX {
    CGPoint center = self.center;
    center.x = fm_centerX;
    self.center = center;
}

- (CGFloat)fm_centerY {
    return self.center.y;
}

- (void)setFm_centerY:(CGFloat)fm_centerY {
    CGPoint center = self.center;
    center.y = fm_centerY;
    self.center = center;
}

- (CGFloat)fm_height {
    return CGRectGetHeight(self.frame);
}

- (void)setFm_height:(CGFloat)fm_height {
    CGRect frame = self.frame;
    frame.size.height = fm_height;
    self.frame = frame;
}

- (CGFloat)fm_width {
    return CGRectGetWidth(self.frame);
}

- (void)setFm_width:(CGFloat)fm_width {
    CGRect frame = self.frame;
    frame.size.width = fm_width;
    self.frame = frame;
}

- (void)setFm_top:(CGFloat)t
{
    self.frame = CGRectMake(self.fm_left, t, self.fm_width, self.fm_height);
}

- (CGFloat)fm_top
{
    return self.frame.origin.y;
}

- (void)setFm_bottom:(CGFloat)b
{
    self.frame = CGRectMake(self.fm_left, b - self.fm_height, self.fm_width, self.fm_height);
}

- (CGFloat)fm_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFm_left:(CGFloat)l
{
    self.frame = CGRectMake(l, self.fm_top, self.fm_width, self.fm_height);
}

- (CGFloat)fm_left
{
    return self.frame.origin.x;
}

- (void)setFm_right:(CGFloat)r
{
    self.frame = CGRectMake(r - self.fm_width, self.fm_top, self.fm_width, self.fm_height);
}

- (CGFloat)fm_right
{
    return self.frame.origin.x + self.frame.size.width;
}

@end
