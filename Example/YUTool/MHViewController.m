//
//  MHViewController.m
//  YUTool
//
//  Created by yu on 04/11/2025.
//  Copyright (c) 2025 yu. All rights reserved.
//

#import "MHViewController.h"

#import "MHFPSLabel.h"

@interface MHViewController ()

@property (nonatomic, strong) MHFPSLabel *s_fpsLabel;

@end

@implementation MHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.orangeColor;
    
    
    self.s_fpsLabel = [[MHFPSLabel alloc] initWithFrame:CGRectMake(10, 100, 0, 0)];
    [self.s_fpsLabel sizeToFit];
    self.s_fpsLabel.alpha = 1;
    [self.view addSubview:self.s_fpsLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
