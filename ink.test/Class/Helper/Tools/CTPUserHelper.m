//
//  CTPUserHelper.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPUserHelper.h"

@implementation CTPUserHelper

+(instancetype)sharedUser{
    
    static CTPUserHelper *_user = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user = [[CTPUserHelper alloc]init];
    });
    
    return _user;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        _nikeName = [[NSUserDefaults standardUserDefaults]objectForKey:@"nikeName"];
        _iconUrl = [[NSUserDefaults standardUserDefaults]objectForKey:@"iconUrl"];
        
        
    }
    return self;
}

+(BOOL)isAutoLogin{
    
    if ([CTPUserHelper sharedUser].nikeName.length == 0) {
        return NO;
    }
    return YES;
}

+(void)saveUser{
    
    
    CTPUserHelper *user = [CTPUserHelper sharedUser];
    if (user.nikeName.length != 0) {
        [[NSUserDefaults standardUserDefaults]setObject:user.nikeName forKey:@"nikeName"];
        [[NSUserDefaults standardUserDefaults]setObject:user.iconUrl forKey:@"iconUrl"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    
}




@end
