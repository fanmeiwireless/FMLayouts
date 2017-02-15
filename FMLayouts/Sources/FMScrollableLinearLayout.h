//
//  FMScrollableLinearLayout.h
//  Fanmei
//
//  Created by 李传格 on 16/10/9.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FMLayouts.h"

// layout subviews linear along axis
@interface FMScrollableLinearLayout : UIScrollView

@property (nonatomic, assign) FMLayoutAxis fmLayout_axis;
@property (nonatomic, assign) CGFloat fmLayout_spacing;
@property (nonatomic, assign) CGFloat fmLayout_leadingSpacing;
@property (nonatomic, assign) CGFloat fmLayout_trailingSpacing;

/* Add a view to the end of the arrangedSubviews list, and call -addSubview: automatically.
 */
- (void)addArrangedSubview:(UIView *)view;

/* Removes a subview from the list of arranged subviews and send it -removeFromSuperview automatically.
 */
- (void)removeArrangedSubview:(UIView *)view;

- (void)addArrangedSubviews:(NSArray *)subviews;

- (void)removeAllArrangedSubviews;

- (void)setArrangeSubviews:(NSArray<UIView *> *)subviews;

- (NSArray<__kindof UIView *> *)fetchArrangedSubviews;

@end
