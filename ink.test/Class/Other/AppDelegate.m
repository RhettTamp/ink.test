//
//  AppDelegate.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/2.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "AppDelegate.h"
#import "CTPTabBarViewController.h"
#import "CTPLocationManager.h"
#import "CTPAdvertiseView.h"
#import "AppDelegate+CTPUMeung.h"
#import "UMSocial.h"
#import "CTPLoginViewController.h"
#import "CTPUserHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化友盟控件
    //[self setupUMeung];
    
    CTPTabBarViewController *mainVC = [[CTPTabBarViewController alloc]init];
    
//    if ([CTPUserHelper isAutoLogin]) {
//        mainVC = [[CTPTabBarViewController alloc]init];
//    }else{
//        mainVC = [[CTPLoginViewController alloc]init];
//    }

    self.window.rootViewController = mainVC;
    
    [[CTPLocationManager sharedManager] getGps:^(NSString *lat, NSString *lon) {
        NSLog(@"%@,%@",lat,lon);
    }];
    
    [self.window makeKeyAndVisible];
    
    CTPAdvertiseView *advertiseView = [CTPAdvertiseView loadAdvertiseView];
    
    [self.window addSubview:advertiseView];

    return YES;
}



//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    BOOL result = [UMSocialSnsService handleOpenURL:url];
//    if (result == FALSE) {
//        //调用其他SDK，例如支付宝SDK等
//    }
//    return result;
//}

@end
