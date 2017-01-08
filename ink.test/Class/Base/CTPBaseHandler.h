//
//  CTPBaseHandler.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/6.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <Foundation/Foundation.h>


//处理完成事件
typedef void(^CompletionBlock)();

//处理事件成功，返回数据
typedef void(^SuccessBlock)(id obj);

typedef void(^FailedBlock)(NSError *error);

@interface CTPBaseHandler : NSObject


@end
