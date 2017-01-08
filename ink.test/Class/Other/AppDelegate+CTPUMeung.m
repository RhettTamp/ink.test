//
//  AppDelegate+CTPUMeung.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "AppDelegate+CTPUMeung.h"
#import "UMSocial.h"
#import "UMSocialSinaSSOHandler.h"

@implementation AppDelegate (CTPUMeung)

-(void)setupUMeung{
    //设置umengkey
    [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2892166685"
                                              secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

@end
