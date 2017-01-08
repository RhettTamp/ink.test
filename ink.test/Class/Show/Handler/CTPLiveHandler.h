//
//  CTPLiveHandler.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/6.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPBaseHandler.h"

@interface CTPLiveHandler : CTPBaseHandler


/**
 获取热门直播信息

 @param success 成功
 @param failed 失败
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

+(void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

+(void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success faild:(FailedBlock)failed;


@end
