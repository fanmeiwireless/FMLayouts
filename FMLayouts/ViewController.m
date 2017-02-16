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

@property (nonatomic, strong) IBOutlet FMScrollableLinearLayout *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.fmLayout_spacing = 30;
    
    [self buildLayoutWithAxis:kFMLayoutAxisHorizonal withTitle:@"Axis:Horizonal"];
    [self buildLayoutWithAxis:kFMLayoutAxisVertical withTitle:@"Axis:Vertical"];
}

- (void)buildLayoutWithAxis:(FMLayoutAxis)axis
                     withTitle:(NSString *)title {
    
    [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionAlongAxis withTitle:[NSString stringWithFormat:@"%@\r\nMain axis distribution:AlongAxis", title]];
    
    [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionFill withTitle:[NSString stringWithFormat:@"%@\r\nMain axis distribution:Fill", title]];
    
    [self buildLayoutWithAxis:axis distribution:FMLayoutDistributionCenter withTitle:[NSString stringWithFormat:@"%@\r\nMain axis distribution:Center", title]];
}

- (void)buildLayoutWithAxis:(FMLayoutAxis)axis
                  distribution:(FMLayoutDistribution)distribution
                     withTitle:(NSString *)title {
    
    [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentCenter withTitle:[NSString stringWithFormat:@"%@\r\nCross axis alignment:Center", title]];
    
    [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentLeading withTitle:[NSString stringWithFormat:@"%@\r\nCross axis alignment:Leading", title]];
    
    [self buildLayoutWithAxis:axis distribution:distribution alignment:FMLayoutAlignmentTrailing withTitle:[NSString stringWithFormat:@"%@\r\nCross axis alignment:Trailing", title]];
}

#define margin (20)

- (void)buildLayoutWithAxis:(FMLayoutAxis)axis
                  distribution:(FMLayoutDistribution)distribution
                     alignment:(FMLayoutAlignment)alignment
                     withTitle:(NSString *)title {
    
    FMLinearLayout *container = [[FMLinearLayout alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), 0) axis:kFMLayoutAxisVertical mainAxisDistribution:FMLayoutDistributionAlongAxis crossAxisAlignment:FMLayoutAlignmentCenter];
    container.fmLayout_spacing = 20;
    container.fmLayout_trailingSpacing = 20;
    container.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(container.bounds), 100)];
    label.numberOfLines = 0;
    label.text = title;
    label.backgroundColor = [UIColor brownColor];
    [container addArrangedSubview:label];
    
    FMLinearLayout *l = [[FMLinearLayout alloc] initWithFrame:CGRectMake(margin, 0, self.scrollView.frame.size.width - margin * 2, 150)];
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
    
    [container addArrangedSubview:l];
    [self.scrollView addArrangedSubview:container];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
