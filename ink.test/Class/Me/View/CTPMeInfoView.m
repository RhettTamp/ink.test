//
//  CTPMeInfoView.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPMeInfoView.h"

@implementation CTPMeInfoView

+(instancetype)loadInfoView{
    return [[[NSBundle mainBundle]loadNibNamed:@"CTPMeInfoView" owner:self options:nil] lastObject];
}

@end
