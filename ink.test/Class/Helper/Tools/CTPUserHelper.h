//
//  CTPUserHelper.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTPUserHelper : NSObject

@property (nonatomic,copy)NSString *iconUrl;
@property (nonatomic,copy)NSString *nikeName;

+(instancetype)sharedUser;

+(BOOL)isAutoLogin;

+(void)saveUser;

@end
