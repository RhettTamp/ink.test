//
//  CTPMainTopView.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);


@interface CTPMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic,copy)MainTopBlock block;

-(void)scrolling:(NSInteger)tag;

@end
