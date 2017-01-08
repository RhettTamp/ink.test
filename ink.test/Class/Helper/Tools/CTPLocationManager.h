//
//  CTPLocationManager.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/8.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat,NSString *lon);

@interface CTPLocationManager : NSObject

+ (instancetype)sharedManager;

-(void)getGps:(LocationBlock)block;

@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *lon;


@end
