//
//  FMFlowView.h
//  Fanmei
//
//  Created by 祝小夏 on 16/11/10.
//  Copyright © 2016年 Fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMFlowView : UIScrollView

@property (nonatomic, strong, readonly) NSMutableArray<__kindof UIView *> *views;
@property (nonatomic, assign) CGFloat layoutSpace;

@property (nonatomic, assign) UIEdgeInsets layoutInset;

- (void)addViews:(NSArray *)views;

- (void)addView:(UIView *)view;

@end
