//
//  CTPTabBar.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CTPItemType){
    
    CTPItemTypeLauch = 10, //启动直播
    CTPItemTypeLive = 100, //展示直播
    CTPItemTypeMe, //我的
};

@class CTPTabBar;

typedef void(^TabBlock)(CTPTabBar *tabBar,CTPItemType idx);

@protocol CTPTabBarDelegate <NSObject>

-(void)tabbar:(CTPTabBar *)tabbar clickButton:(CTPItemType)idx;

@end

@interface CTPTabBar : UIView

@property (nonatomic,weak)id <CTPTabBarDelegate> delegate;

@property (nonatomic,copy)TabBlock block;

@end
