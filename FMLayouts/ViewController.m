//
//  ViewController.m
//  FMLayouts
//
//  Created by 李传格 on 17/2/15.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import "ViewController.h"
#import "FMLayouts.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat offsetY = 0;
    offsetY = [self demo1AtOffsetY:offsetY];
    offsetY = [self demo2AtOffsetY:offsetY];
    offsetY = [self demo3AtOffsetY:offsetY];
    offsetY = [self demo4AtOffsetY:offsetY];
}

- (CGFloat)demo1AtOffsetY:(CGFloat)offsetY {
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(20, offsetY + 20, self.scrollView.fm_width - 40, 40)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_spacing = 10;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 60, 30)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 15)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return offsetY + l.fm_height + 40;
}

- (CGFloat)demo2AtOffsetY:(CGFloat)offsetY {
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(20, offsetY + 20, self.scrollView.fm_width - 40, 40)];
    l.fmLayout_spacing = 10;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 60, 30)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 15)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return offsetY + l.fm_height + 40;
}

- (CGFloat)demo3AtOffsetY:(CGFloat)offsetY {
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(20, offsetY + 20, self.scrollView.fm_width - 40, 40)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_distribution = FMLayoutDistributionFill;
    l.fmLayout_spacing = 10;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 60, 30)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 15)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return offsetY + l.fm_height + 40;
}

- (CGFloat)demo4AtOffsetY:(CGFloat)offsetY {
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(20, offsetY + 20, self.scrollView.fm_width - 40, 40)];
    l.fmLayout_distribution = FMLayoutDistributionFill;
    l.fmLayout_spacing = 10;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 60, 30)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 15)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return offsetY + l.fm_height + 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
