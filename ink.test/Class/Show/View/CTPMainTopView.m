//
//  CTPMainTopView.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPMainTopView.h"

@interface CTPMainTopView ()

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong)NSMutableArray *buttons;

@end

@implementation CTPMainTopView

-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnWidth = self.width/titles.count;
        CGFloat btnHeight = self.height;
        
        for (NSInteger i = 0; i < titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *vcName = titles[i];
            //设置按钮文字
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            titleBtn.frame = CGRectMake(btnWidth * i, 0, btnWidth, btnHeight);
            
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.buttons addObject:titleBtn];
            
            [self addSubview:titleBtn];
            
            if (i == 1) {
                
                CGFloat height = 2;
                CGFloat y = 38;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineView = [[UIView alloc]init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView.height = height;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                
                [self addSubview:self.lineView];
            }
        }
        
    }
    return self;
}


//MainVc滚动时调用
-(void)scrolling:(NSInteger)tag{
    
    UIButton *button = self.buttons[tag];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}

-(void)titleClick:(UIButton *)button
{
    if (self.block) {
        self.block(button.tag);
    }
    [self scrolling:button.tag];
}

@end
