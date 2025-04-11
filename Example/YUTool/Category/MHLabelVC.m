//
//  MHLabelVC.m
//  YUTool_Example
//
//  Created by yu on 2025/4/11.
//  Copyright © 2025 yu~mohu. All rights reserved.
//

#import "MHLabelVC.h"
#import "UILabel+MHInsets.h"

@interface MHLabelVC ()

@end

@implementation MHLabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, CGRectGetWidth(self.view.frame) - 20, 50)];
    titleLabel.text = @"这是一段测试Label内边距的控件";
    titleLabel.backgroundColor = UIColor.lightGrayColor;
    titleLabel.font = [UIFont systemFontOfSize:14.f];
    titleLabel.textColor = UIColor.redColor;
    titleLabel.numberOfLines = 0;
    titleLabel.mh_contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:titleLabel];
    
}

@end
