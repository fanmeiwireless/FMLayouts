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
    
    CGFloat offsetY = [self buildLayoutWithAxis:kFMLayoutAxisHorizonal withTitle:@"Axis:Horizonal" offsetY:0];
    
    offsetY = [self buildLayoutWithAxis:kFMLayoutAxisVertical withTitle:@"Axis:Vertical" offsetY:offsetY];
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, offsetY);
}

- (CGFloat)buildLayoutWithAxis:(FMLayoutAxis)axis
                     withTitle:(NSString *)title
                       offsetY:(CGFloat)offsetY {
    
    offsetY = [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionAlongAxis withTitle:[NSString stringWithFormat:@"%@\r\nDistribution:AlongAxis", title] offsetY:offsetY];
    
    offsetY = [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionFill withTitle:[NSString stringWithFormat:@"%@\r\nDistribution:Fill", title] offsetY:offsetY];
    
    offsetY = [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionCenter withTitle:[NSString stringWithFormat:@"%@\r\nDistribution:Center", title] offsetY:offsetY];
    
    offsetY = [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionBetween withTitle:[NSString stringWithFormat:@"%@\r\nDistribution:Between", title] offsetY:offsetY];
    
    return offsetY;
}

- (CGFloat)buildLayoutWithAxis:(FMLayoutAxis)axis
                  distribution:(FMLayoutDistribution)distribution
                     withTitle:(NSString *)title
                       offsetY:(CGFloat)offsetY {
    
    offsetY = [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentCenter withTitle:[NSString stringWithFormat:@"%@\r\nAlignment:Center", title] offsetY:offsetY];
    
    offsetY = [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentLeading withTitle:[NSString stringWithFormat:@"%@\r\nAlignment:Leading", title] offsetY:offsetY];
    
    offsetY = [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentTrailing withTitle:[NSString stringWithFormat:@"%@\r\nAlignment:Trailing", title] offsetY:offsetY];
    
    return offsetY;
}

#define margin (20)

- (CGFloat)buildLayoutWithAxis:(FMLayoutAxis)axis
                  distribution:(FMLayoutDistribution)distribution
                     alignment:(FMLayoutAlignment)alignment
                     withTitle:(NSString *)title
                       offsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, offsetY, self.scrollView.fm_width, 100)];
    label.numberOfLines = 0;
    label.text = title;
    [self.scrollView addSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(label.frame), self.scrollView.fm_width - margin * 2, 100)];
    l.fmLayout_axis = axis;
    l.fmLayout_distribution = distribution;
    l.fmLayout_alignment = alignment;
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
