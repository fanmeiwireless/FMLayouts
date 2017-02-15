//
//  FMFlowView.m
//  Fanmei
//
//  Created by 祝小夏 on 16/11/10.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import "FMFlowView.h"

@interface FMFlowView ()
@property (nonatomic, strong) NSMutableArray<__kindof UIView *> *views;
@end

@implementation FMFlowView

- (NSMutableArray<UIView *> *)views {
    if (nil == _views) {
        _views = [[NSMutableArray alloc]init];
    }
    return _views;
}

- (void)addViews:(NSArray *)views {
    if (views.count) {
        for (UIView *view in views) {
            [self addView:view];
        }
    }
}

- (void)addView:(UIView *)view {
    if (view) {
        [self resetViewFrame:view];
        [self addSubview:view];
        [self.views addObject:view];
        [self resetContentSize];
    }
    
}

- (void)resetViewFrame:(UIView *)view {
    if (view) {
        if (self.views.count) {
            if (CGRectGetWidth(view.frame) > CGRectGetWidth(self.frame) - (CGRectGetMaxX(self.views.lastObject.frame) + self.layoutInset.right + self.layoutSpace)) {
                view.frame = CGRectMake(self.layoutInset.left, CGRectGetMaxY(self.views.lastObject.frame) + self.layoutSpace, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }else {
                view.frame = CGRectMake(CGRectGetMaxX(self.views.lastObject.frame) + self.layoutSpace,CGRectGetMinY(self.views.lastObject.frame),CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
            }
        }else {
            view.frame = CGRectMake(self.layoutInset.left, self.layoutInset.top, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
        }
        if (CGRectGetWidth(view.frame) > (CGRectGetWidth(self.frame) - self.layoutInset.left - self.layoutInset.right)) {
            CGRect rect = view.frame;
            rect.size.width = CGRectGetWidth(self.frame) - self.layoutInset.left - self.layoutInset.right;
            view.frame = rect;
        }
    }
}

- (void)resetContentSize {
    if (self.views.count) {
        CGFloat bottomY = CGRectGetMaxY(self.views.lastObject.frame) + self.layoutInset.bottom;
        if (bottomY > CGRectGetHeight(self.frame)) {
            self.contentSize = CGSizeMake(CGRectGetWidth(self.frame), bottomY);
        }else {
            self.contentSize = self.frame.size;
        }
    }
}

@end
