//
//  CTPCachHelper.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/10.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPCachHelper.h"

#define advertiseImage @"adImage"

@implementation CTPCachHelper

+(NSString *)getAdvertise{

    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImage];
}

+(void)setAdvertise:(NSString *)adImage{
    
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImage];
}

@end
