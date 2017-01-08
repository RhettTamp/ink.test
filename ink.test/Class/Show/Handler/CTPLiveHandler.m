//
//  CTPLiveHandler.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/6.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLiveHandler.h"
#import "CTPHttpTool.h"
#import "CTPLive.h"
#import "CTPLocationManager.h"
#import "CTPAdvertise.h"

@implementation CTPLiveHandler

+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    [CTPHttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue]) {
            
            failed(json[@"error_msg"]);
        
        }else{
            //如果返回信息正确
            //数据解析
            
            NSArray *lives = [CTPLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);

        }
        
        
    } failure:^(NSError *error) {
       
        failed(error);
    
    }];
}

+(void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    
    CTPLocationManager *manager = [CTPLocationManager sharedManager];
    
    NSDictionary *params = @{@"uid":@"85149891",@"latitude":manager.lat,@"longitude":manager.lon};
    
    
    
    [CTPHttpTool getWithPath:API_NearLive params:params success:^(id json) {
        
        
        if ([json[@"dm_error"] integerValue]) {
            
            failed(json[@"error_msg"]);
            
        }else{
            //如果返回信息正确
            //数据解析
            
            NSArray *lives = [CTPLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
            
         }
            
    } failure:^(NSError *error) {
        failed(error);
    }];
}

+(void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success faild:(FailedBlock)failed{
    [CTPHttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue]) {
            
            failed(json[@"error_msg"]);
            
        }else{
            //如果返回信息正确
            //数据解析
            CTPAdvertise *advertise = [CTPAdvertise mj_objectWithKeyValues:json[@"resources"][0]];
            success(advertise);
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
}

@end
