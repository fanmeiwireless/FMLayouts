//
//  FMLinearLayout.h
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FMLayouts.h"

/*
 Layout along the main axis.
 */
typedef NS_ENUM(NSInteger, FMLayoutDistribution) {
    /*
     Adjust `FMLinearLayout` size along main axis, to fit arranged subviews and spacings.
     */
    FMLayoutDistributionAlongAxis = 0,
    
    /*
     Adjust arranged subviews size to fill size of `FMLinearLayout` along main axis.
     */
    FMLayoutDistributionFill,
    
//    /*
//     Adjust `fmLayout_leadingSpacing` and `fmLayout_trailingSpacing`, arranged subviews alignment center along main axis.
//     */
//    FMLayoutDistributionCenter,
//    
//    /*
//     Adjust `fmLayout_spacing`, arranged subviews alignment center along main axis.
//     */
//    FMLayoutDistributionBetween
};

/*
 Layout along the cross axis.
 */
typedef NS_ENUM(NSInteger, FMLayoutAlignment) {
    /*
     Arranged subviews alignment center along cross axis.
     */
    FMLayoutAlignmentCenter = 0,
    
    FMLayoutAlignmentLeading,
    
    FMLayoutAlignmentTrailing,
};

/*
 A simple linear layout, similar to UIStackView in iOS and LinearLayout in android.
 */
@interface FMLinearLayout : UIView

- (instancetype)initWithVerticalAxisAndWidth:(CGFloat)width;
- (instancetype)initWithHorizonalAxisAndHeight:(CGFloat)height;
- (instancetype)initWithAxis:(FMLayoutAxis)axis contentMode:(FMLayoutDistribution)contentMode size:(CGSize)size;

#pragma mark - configs

@property (nonatomic, assign) FMLayoutAxis fmLayout_axis;
@property (nonatomic, assign) FMLayoutDistribution fmLayout_distribution;
@property (nonatomic, assign) FMLayoutAlignment fmLayout_alignment;
@property (nonatomic, assign) CGFloat fmLayout_spacing;
@property (nonatomic, assign) CGFloat fmLayout_leadingSpacing;
@property (nonatomic, assign) CGFloat fmLayout_trailingSpacing;

#pragma mark - apis

/* Add a view to the end of the arrangedSubviews list, and call -addSubview: automatically.
 */
- (void)addArrangedSubview:(UIView *)view;
- (void)addArrangedSubviews:(NSArray *)subviews;

/* Removes a subview from the list of arranged subviews and send it -removeFromSuperview automatically.
 */
- (void)removeArrangedSubview:(UIView *)view;
- (void)removeAllArrangedSubviews;

@end
