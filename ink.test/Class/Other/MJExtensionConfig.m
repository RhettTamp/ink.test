//
//  MJExtensionConfig.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/6.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "CTPCreator.h"
#import "CTPLive.h"

@implementation MJExtensionConfig

+ (void)load{
    
    //NSObject中的ID属性对应字典中的id
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID":@"id"};
    }];
    
    [CTPCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"descriptionField":@"description"};
    }];
    
    //所有驼峰属性转成下划线key去字典取值
    [CTPCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [CTPLive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
