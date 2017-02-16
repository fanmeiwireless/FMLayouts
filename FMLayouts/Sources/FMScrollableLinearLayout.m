//
//  FMScrollableLinearLayout.m
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import "FMScrollableLinearLayout.h"

@interface FMScrollableLinearLayout ()

@property (nonatomic, strong) FMLinearLayout *layout;

@end

@implementation FMScrollableLinearLayout

- (FMLinearLayout *)layout {
    if (!_layout) {
        _layout = [[FMLinearLayout alloc] initWithFrame:self.bounds];
        [self addSubview:_layout];
    }
    return _layout;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.layout.frame = self.bounds;
}

- (void)setFmLayout_axis:(FMLayoutAxis)fmLayout_axis {
    self.layout.fmLayout_axis = fmLayout_axis;
}

- (FMLayoutAxis)fmLayout_axis {
    return self.layout.fmLayout_axis;
}

- (void)setFmLayout_spacing:(CGFloat)fmLayout_spacing {
    self.layout.fmLayout_spacing = fmLayout_spacing;
}

- (CGFloat)fmLayout_spacing {
    return self.layout.fmLayout_spacing;
}

- (void)setFmLayout_leadingSpacing:(CGFloat)fmLayout_leadingSpacing {
    self.layout.fmLayout_leadingSpacing = fmLayout_leadingSpacing;
}

- (CGFloat)fmLayout_leadingSpacing {
    return self.layout.fmLayout_leadingSpacing;
}

- (void)setFmLayout_trailingSpacing:(CGFloat)fmLayout_trailingSpacing {
    self.layout.fmLayout_trailingSpacing = fmLayout_trailingSpacing;
}

- (CGFloat)fmLayout_trailingSpacing {
    return self.layout.fmLayout_trailingSpacing;
}

- (void)addArrangedSubview:(UIView *)view {
    [self.layout addArrangedSubview:view];
    self.contentSize = self.layout.frame.size;
}

- (void)removeArrangedSubview:(UIView *)view {
    [self.layout removeArrangedSubview:view];
    self.contentSize = self.layout.frame.size;
}

- (void)addArrangedSubviews:(NSArray *)subviews {
    if (subviews) {
        [subviews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addArrangedSubview:obj];
        }];
    }
}

- (void)removeAllArrangedSubviews {
    [self.layout removeAllArrangedSubviews];
    self.contentSize = self.layout.frame.size;
}

- (void)setArrangeSubviews:(NSArray<UIView *> *)subviews {
    CGPoint offset = self.contentOffset;
    CGSize oldContentSize = self.contentSize;
    [self removeAllArrangedSubviews];
    [self addArrangedSubviews:subviews];
    
    // adjust content offset
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
    return [self.layout fetchArrangedSubviews];
}

@end
