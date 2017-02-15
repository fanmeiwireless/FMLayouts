//
//  FMLinearLayout.m
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import "FMLinearLayout.h"

@interface FMLinearLayout ()

@property (nonatomic, strong) NSMutableArray<__kindof UIView *> *arrangedSubviews;

@end

@implementation FMLinearLayout

- (NSMutableArray *)arrangedSubviews {
    if (!_arrangedSubviews) {
        _arrangedSubviews = [[NSMutableArray alloc] init];
    }
    return _arrangedSubviews;
}

- (instancetype)initWithVerticalAxisAndWidth:(CGFloat)width {
    return [self initWithAxis:kFMLayoutAxisVertical contentMode:FMLayoutDistributionAlongAxis size:CGSizeMake(width, 0)];
}

- (instancetype)initWithHorizonalAxisAndHeight:(CGFloat)height {
    return [self initWithAxis:kFMLayoutAxisHorizonal contentMode:FMLayoutDistributionAlongAxis size:CGSizeMake(0, height)];
}

- (instancetype)initWithAxis:(FMLayoutAxis)axis contentMode:(FMLayoutDistribution)contentMode size:(CGSize)size {
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        self.fmLayout_axis = axis;
        self.fmLayout_distribution = contentMode;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    BOOL isFrameChanged = !CGRectEqualToRect(self.frame, frame);
    [super setFrame:frame];
    
    if (isFrameChanged && self.fmLayout_distribution == FMLayoutDistributionFill) {
        [self distributeSubviewsInAxis];
    }
}

#pragma mark - resize

- (void)alignSubview:(UIView *)subview {
    if (subview) {
        if (self.fmLayout_axis == kFMLayoutAxisVertical) {
            if (self.fmLayout_alignment == FMLayoutAlignmentCenter) {
                subview.fm_centerX = self.fm_width / 2;
            }
            else if (self.fmLayout_alignment == FMLayoutAlignmentLeading) {
                subview.fm_x = 0;
            }
            else if (self.fmLayout_alignment == FMLayoutAlignmentTrailing) {
                subview.fm_right = self.fm_width;
            }
        }
        else {
            if (self.fmLayout_alignment == FMLayoutAlignmentCenter) {
                subview.fm_centerY = self.fm_height / 2;
            }
            else if (self.fmLayout_alignment == FMLayoutAlignmentLeading) {
                subview.fm_y = 0;
            }
            else if (self.fmLayout_alignment == FMLayoutAlignmentTrailing) {
                subview.fm_bottom = self.fm_height;
            }
        }
    }
}

- (void)distributeLatestAddedSubviewAlongAxis {
    if (self.arrangedSubviews.count <= 0) {
        return;
    }
    
    if (self.fmLayout_distribution != FMLayoutDistributionAlongAxis) {
        return;
    }
    
    UIView *prevSubView = self.arrangedSubviews.count >= 2 ? self.arrangedSubviews[self.arrangedSubviews.count - 2] : nil;
    UIView *subview = self.arrangedSubviews.lastObject;
    
    if (subview) {
        if (self.fmLayout_axis == kFMLayoutAxisVertical) {
            if (prevSubView) {
                subview.fm_y = CGRectGetMaxY(prevSubView.frame) + self.fmLayout_spacing;
            }
            else {
                subview.fm_y = self.fmLayout_leadingSpacing;
            }
        }
        else {
            if (prevSubView) {
                subview.fm_x = CGRectGetMaxX(prevSubView.frame) + self.fmLayout_spacing;
            }
            else {
                subview.fm_x = self.fmLayout_leadingSpacing;
            }
        }
        
        [self alignSubview:subview];
    }
}

- (void)distributeSubviewsInAxis {
    if (self.arrangedSubviews.count <= 0) {
        return;
    }
    
    if (self.fmLayout_axis == kFMLayoutAxisVertical) {
        if (self.fmLayout_distribution == FMLayoutDistributionFill) {
            CGFloat avgHeight = (CGRectGetHeight(self.frame) - self.fmLayout_leadingSpacing - self.fmLayout_trailingSpacing - (self.arrangedSubviews.count - 1) * self.fmLayout_spacing) / self.arrangedSubviews.count;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_y = (self.fmLayout_leadingSpacing + (avgHeight + self.fmLayout_spacing) * idx);
                obj.fm_height = avgHeight;
                [self alignSubview:obj];
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionAlongAxis) {
            __block CGFloat yOffset = self.fmLayout_leadingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_y = yOffset;
                [self alignSubview:obj];
                yOffset = CGRectGetMaxY(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    yOffset += self.fmLayout_spacing;
                }
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionCenter) {
            __block CGFloat totalHeight = (self.arrangedSubviews.count - 1) * self.fmLayout_spacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                totalHeight += obj.fm_height;
            }];
            
            CGFloat margin = (self.fm_height - totalHeight) / 2;
            
            __block CGFloat yOffset = margin;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_y = yOffset;
                [self alignSubview:obj];
                yOffset = CGRectGetMaxY(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    yOffset += self.fmLayout_spacing;
                }
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionBetween) {
            __block CGFloat totalHeight = self.fmLayout_leadingSpacing + self.fmLayout_trailingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                totalHeight += obj.fm_height;
            }];
            
            CGFloat spacing = self.arrangedSubviews.count > 1 ?  (self.fm_height - totalHeight) / (self.arrangedSubviews.count - 1) : 0;
            
            __block CGFloat yOffset = self.fmLayout_leadingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_y = yOffset;
                [self alignSubview:obj];
                yOffset = CGRectGetMaxY(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    yOffset += spacing;
                }
            }];
        }
    }
    else {
        if (self.fmLayout_distribution == FMLayoutDistributionFill) {
            CGFloat avgWidth = (CGRectGetWidth(self.frame) - self.fmLayout_leadingSpacing - self.fmLayout_trailingSpacing - (self.arrangedSubviews.count - 1) * self.fmLayout_spacing) / self.arrangedSubviews.count;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_x = (self.fmLayout_leadingSpacing + (avgWidth + self.fmLayout_spacing) * idx);
                obj.fm_width = avgWidth;
                [self alignSubview:obj];
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionAlongAxis) {
            __block CGFloat xOffset = self.fmLayout_leadingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_x = xOffset;
                [self alignSubview:obj];
                xOffset = CGRectGetMaxX(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    xOffset += self.fmLayout_spacing;
                }
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionCenter) {
            __block CGFloat totalWidth = (self.arrangedSubviews.count - 1) * self.fmLayout_spacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                totalWidth += obj.fm_width;
            }];
            
            CGFloat margin = (self.fm_width - totalWidth) / 2;
            
            __block CGFloat xOffset = margin;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_x = xOffset;
                [self alignSubview:obj];
                xOffset = CGRectGetMaxX(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    xOffset += self.fmLayout_spacing;
                }
            }];
        }
        else if (self.fmLayout_distribution == FMLayoutDistributionBetween) {
            __block CGFloat totalWidth = self.fmLayout_leadingSpacing + self.fmLayout_trailingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                totalWidth += obj.fm_width;
            }];
            
            CGFloat spacing = self.arrangedSubviews.count > 1 ?  (self.fm_width - totalWidth) / (self.arrangedSubviews.count - 1) : 0;
            
            __block CGFloat xOffset = self.fmLayout_leadingSpacing;
            [self.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.fm_x = xOffset;
                [self alignSubview:obj];
                xOffset = CGRectGetMaxX(obj.frame);
                if (idx < self.arrangedSubviews.count - 1) {
                    xOffset += spacing;
                }
            }];
        }
    }
}

- (void)resizeSelfInAxisToFitSubviews {
    if (self.fmLayout_distribution != FMLayoutDistributionAlongAxis) {
        return;
    }
    
    if (self.fmLayout_axis == kFMLayoutAxisVertical) {
        CGFloat height = self.arrangedSubviews.count > 0 ? (CGRectGetMaxY(self.arrangedSubviews.lastObject.frame) + self.fmLayout_trailingSpacing) : (self.fmLayout_leadingSpacing + self.fmLayout_trailingSpacing);
        
        if (height != self.fm_height) {
            self.fm_height = height;
        }
    }
    else {
        CGFloat width = self.arrangedSubviews.count > 0 ? (CGRectGetMaxX(self.arrangedSubviews.lastObject.frame) + self.fmLayout_trailingSpacing) : (self.fmLayout_leadingSpacing + self.fmLayout_trailingSpacing);
        
        if (width != self.fm_width) {
            self.fm_width = width;
        }
    }
}

#pragma mark - apis

- (void)addArrangedSubview:(UIView *)view {
    if (view) {
        [self addSubview:view];
        [self.arrangedSubviews addObject:view];
        
        // distribution and alignment
        if (self.fmLayout_distribution == FMLayoutDistributionAlongAxis) {
            [self distributeLatestAddedSubviewAlongAxis];
            [self resizeSelfInAxisToFitSubviews];
        }
        else {
            [self distributeSubviewsInAxis];
        }
    }
}

- (void)addArrangedSubviews:(NSArray *)subviews {
    if (subviews) {
        [subviews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addArrangedSubview:obj];
        }];
    }
}

- (void)removeArrangedSubview:(UIView *)view {
    if (view) {
        [view removeFromSuperview];
        [self.arrangedSubviews removeObject:view];
        [self distributeSubviewsInAxis];
        if (self.fmLayout_distribution == FMLayoutDistributionAlongAxis) {
            [self resizeSelfInAxisToFitSubviews];
        }
    }
}

- (void)removeAllArrangedSubviews {
    [self.arrangedSubviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.arrangedSubviews removeAllObjects];
    [self distributeSubviewsInAxis];
    if (self.fmLayout_distribution == FMLayoutDistributionAlongAxis) {
        [self resizeSelfInAxisToFitSubviews];
    }
}

@end
