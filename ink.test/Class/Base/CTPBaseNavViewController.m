//
//  CTPBaseNavViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPBaseNavViewController.h"

@interface CTPBaseNavViewController ()

@end

@implementation CTPBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.barTintColor = RGB(0, 216, 201);
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

@end
