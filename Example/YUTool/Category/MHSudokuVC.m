//
//  MHSudokuVC.m
//  YUTool_Example
//
//  Created by yu on 2025/4/11.
//  Copyright © 2025 yu~mohu. All rights reserved.
//

#import "MHSudokuVC.h"
#import "Masonry.h"
#import "MHCategory.h"

@interface MHSudokuVC ()

@end

@implementation MHSudokuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 300)];
    containerView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:containerView];
    
    for (NSInteger i = 0; i < 9; i ++) {
        UIView *itemView = [UIView new];
        itemView.backgroundColor = UIColor.orangeColor;
        [containerView addSubview:itemView];
    }
//    [containerView.subviews mas_distributeSudokuViewsWithFixedLineSpacing:10 fixedInteritemSpacing:10 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
//    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:100 fixedItemHeight:80 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
//    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:100 fixedItemHeight:80 fixedLineSpacing:10 fixedInteritemSpacing:10 warpCount:3 topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}

@end
