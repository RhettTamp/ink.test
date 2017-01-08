//
//  CTPLauchViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLaunchViewController.h"
#import "LFLivePreview.h"

@interface CTPLaunchViewController ()

@end

@implementation CTPLaunchViewController
- (IBAction)closeLaunch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)statrtLive:(id)sender {
    
    UIView *backView = [[UIView alloc]initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    
    LFLivePreview *preView = [[LFLivePreview alloc]initWithFrame:self.view.bounds];
    
    
    //问题：为什么不加这句话会崩溃
    //preView.vc = self;
    [preView startLive];
    [self.view addSubview:preView];
    
}


@end
