//
//  CTPTabBar.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPTabBar.h"


@interface CTPTabBar ()

@property (nonatomic,strong)UIImageView *tabbgView;
@property (nonatomic,strong)NSArray *datalist;
@property (nonatomic,strong)UIButton *lastItem;
@property (nonatomic,strong)UIButton *cameraButton;

@end




@implementation CTPTabBar

-(UIButton *)cameraButton{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

-(NSArray *)datalist{
    if (!_datalist) {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

- (UIImageView *)tabbgView{
    if(!_tabbgView){
        
    }
    return _tabbgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //装载背景
        [self addSubview:self.tabbgView];
        
        //装载item
        for (NSUInteger i = 0; i < self.datalist.count; i++) {
            
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            //不显示高亮状态的自适应图片
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = CTPItemTypeLive + i;
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            [self addSubview:item];
            
        }
        //添加直播按钮
        
        [self addSubview:self.cameraButton];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width/self.datalist.count;
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
       
        UIView *btn = self.subviews[i];
        
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake((btn.tag - CTPItemTypeLive) * width, 0, width, self.frame.size.height);
            
        }
    }
    [_cameraButton sizeToFit];
    self.cameraButton.tag = CTPItemTypeLauch;
    self.cameraButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2 - 20);
}

-(void)clickItem:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:sender.tag];
    }
//    !self.block?:self.block(self,sender.tag);
    if (self.block) {
        self.block(self,sender.tag);
    }
    
    if (sender.tag == CTPItemTypeLauch) {
        return;
    }
    
    
    self.lastItem.selected = NO;
    sender.selected = YES;
    self.lastItem = sender;
    
    //设置动画
    [UIView animateWithDuration:0.1 animations:^{
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        //恢复原始状态
        [UIView animateWithDuration:0.1 animations:^{
            sender.transform = CGAffineTransformIdentity;
        }];
    }];
        
}








@end
