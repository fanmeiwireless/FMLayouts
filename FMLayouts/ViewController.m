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
    offsetY = [self demo5AtOffsetY:offsetY];
    offsetY = [self demo6AtOffsetY:offsetY];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, offsetY);
}

#define margin (20)

- (CGFloat)demo1AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Horizonal, distribution:AlongAxis, spacing:10, leadingSpacing:20, trailingSpacing:20";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_distribution = FMLayoutDistributionAlongAxis;
    l.fmLayout_spacing = 10;
    l.fmLayout_leadingSpacing = 20;
    l.fmLayout_trailingSpacing = 20;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (CGFloat)demo2AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Horizonal, distribution:AlongAxis, alignment:Leading spacing:20, leadingSpacing:40, trailingSpacing:10";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_distribution = FMLayoutDistributionAlongAxis;
    l.fmLayout_alignment = FMLayoutAlignmentLeading;
    l.fmLayout_spacing = 20;
    l.fmLayout_leadingSpacing = 40;
    l.fmLayout_trailingSpacing = 10;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (CGFloat)demo3AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Horizonal, distribution:Fill, spacing:10, leadingSpacing:20, trailingSpacing:20";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_distribution = FMLayoutDistributionFill;
    l.fmLayout_spacing = 10;
    l.fmLayout_leadingSpacing = 20;
    l.fmLayout_trailingSpacing = 20;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (CGFloat)demo4AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Horizonal, distribution:Fill, alignment:Trailing spacing:0, leadingSpacing:0, trailingSpacing:20";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisHorizonal;
    l.fmLayout_distribution = FMLayoutDistributionFill;
    l.fmLayout_alignment = FMLayoutAlignmentTrailing;
    l.fmLayout_spacing = 0;
    l.fmLayout_leadingSpacing = 0;
    l.fmLayout_trailingSpacing = 20;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (CGFloat)demo5AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Vertical, distribution:AlongAxis, spacing:10, leadingSpacing:20, trailingSpacing:20";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width / 2 - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisVertical;
    l.fmLayout_distribution = FMLayoutDistributionAlongAxis;
    l.fmLayout_spacing = 10;
    l.fmLayout_leadingSpacing = 20;
    l.fmLayout_trailingSpacing = 20;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (CGFloat)demo6AtOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = @"Axis:Vertical, distribution:Fill, spacing:10, leadingSpacing:20, trailingSpacing:20";
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width / 2 - margin * 2, 100)];
    l.fmLayout_axis = kFMLayoutAxisVertical;
    l.fmLayout_distribution = FMLayoutDistributionFill;
    l.fmLayout_spacing = 10;
    l.fmLayout_leadingSpacing = 20;
    l.fmLayout_trailingSpacing = 20;
    l.backgroundColor = [UIColor grayColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v1.backgroundColor = [UIColor purpleColor];
    [l addArrangedSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(300, 20, 80, 40)];
    v2.backgroundColor = [UIColor greenColor];
    [l addArrangedSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 40, 80)];
    v3.backgroundColor = [UIColor orangeColor];
    [l addArrangedSubview:v3];
    
    [self.scrollView addSubview:l];
    
    return CGRectGetMaxY(l.frame) + margin * 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
