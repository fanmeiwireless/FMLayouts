//
//  FMScrollableLinearLayout.m
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import "FMScrollableLinearLayout.h"

@interface FMScrollableLinearLayout ()

@property (nonatomic, strong) NSMutableArray<__kindof UIView *> *arrangedSubviews;

@end

@implementation FMScrollableLinearLayout

- (NSMutableArray *)arrangedSubviews {
    if (!_arrangedSubviews) {
        _arrangedSubviews = [[NSMutableArray alloc] init];
    }
    return _arrangedSubviews;
}

- (void)addArrangedSubview:(UIView *)view {
    if (view) {
        [self reoffsetAddedViewInAxis:view];
        [self addSubview:view];
        [self.arrangedSubviews addObject:view];
        [self resizeSelfContentSize];
    }
}

- (void)removeArrangedSubview:(UIView *)view {
    if (view) {
        [view removeFromSuperview];
        [self.arrangedSubviews removeObject:view];
        [self reoffsetSubviewsInAxis];
        [self resizeSelfContentSize];
    }
}

- (void)addArrangedSubviews:(NSArray *)subviews {
    if (subviews) {
        [subviews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addArrangedSubview:obj];
        }];
    }
}

- (void)removeAllArrangedSubviews {
    [self.arrangedSubviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.arrangedSubviews removeAllObjects];
    [self resizeSelfContentSize];
}

- (void)setArrangeSubviews:(NSArray<UIView *> *)subviews {
    CGPoint offset = self.contentOffset;
    CGSize oldContentSize = self.contentSize;
    [self removeAllArrangedSubviews];
    [self addArrangedSubviews:subviews];
    if (self.fmLayout_axis == kFMLayoutAxisVertical) {
        if (self.contentSize.height < oldContentSize.height) {
            if (offset.y > self.contentSize.height + self.contentInset.bottom + self.contentInset.top - CGRectGetHeight(self.bounds)) {
                offset.y = self.contentSize.height + self.contentInset.bottom + self.contentInset.top - CGRectGetHeight(self.bounds);
                if (offset.y < -self.contentInset.top) {
                    offset.y = -self.contentInset.top;
                }
            }
        }
    }
    else {
        if (self.contentSize.width < oldContentSize.width) {
            if (offset.x > self.contentSize.width + self.contentInset.right + self.contentInset.left - CGRectGetWidth(self.bounds)) {
                offset.x = self.contentSize.width + self.contentInset.right + self.contentInset.left - CGRectGetWidth(self.bounds);
                if (offset.x < -self.contentInset.left) {
                    offset.x = -self.contentInset.left;
                }
                
            }
        }
    }
    
    self.contentOffset = offset;
}

- (NSArray<__kindof UIView *> *)fetchArrangedSubviews {
    return self.arrangedSubviews;
}

#pragma mark - resize

- (void)reoffsetAddedViewInAxis:(UIView *)view {
    if (view) {
        CGFloat spacing = view.layoutConfig.fm_spacing >= 0 ? view.layoutConfig.fm_spacing : self.fmLayout_spacing;
        if (self.fmLayout_axis == kFMLayoutAxisVertical) {
            CGFloat yOffset = self.arrangedSubviews.count > 0 ? CGRectGetMaxY(self.arrangedSubviews.lastObject.frame) + spacing : self.fmLayout_leadingSpacing;
            [self reoffsetY:yOffset ofView:view];
        }
        else {
            CGFloat xOffset = self.arrangedSubviews.count > 0 ? CGRectGetMaxX(self.arrangedSubviews.lastObject.frame) + spacing : self.fmLayout_leadingSpacing;
            [self reoffsetX:xOffset ofView:view];
        }
    }
}

- (void)reoffsetSubviewsInAxis {
    if (self.fmLayout_axis == kFMLayoutAxisVertical) {
        __block CGFloat yOffset = self.fmLayout_leadingSpacing;
        [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self reoffsetY:yOffset ofView:obj];
            yOffset = CGRectGetMaxY(obj.frame);
            if (idx < self.arrangedSubviews.count - 1) {
                yOffset += obj.layoutConfig.fm_spacing >= 0 ? obj.layoutConfig.fm_spacing : self.fmLayout_spacing;
            }
        }];
    }
    else {
        __block CGFloat xOffset = self.fmLayout_leadingSpacing;
        [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self reoffsetX:xOffset ofView:obj];
            xOffset = CGRectGetMaxX(obj.frame);
            if (idx < self.arrangedSubviews.count - 1) {
                xOffset += obj.layoutConfig.fm_spacing >= 0 ? obj.layoutConfig.fm_spacing : self.fmLayout_spacing;
            }
        }];
    }
}

- (void)resizeSelfContentSize {
    if (self.fmLayout_axis == kFMLayoutAxisVertical) {
        CGFloat yOffset = self.subviews.count > 0 ? CGRectGetMaxY(self.subviews.lastObject.frame) + self.fmLayout_trailingSpacing : 0;
        self.contentSize = CGSizeMake(self.frame.size.width, yOffset);
    }
    else {
        CGFloat xOffset = self.subviews.count > 0 ? CGRectGetMaxX(self.subviews.lastObject.frame) + self.fmLayout_trailingSpacing : 0;
        self.contentSize = CGSizeMake(xOffset, self.frame.size.height);
    }
}

@end
