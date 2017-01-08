//
//  CTPNearLiveCell.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/9.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPNearLiveCell.h"

@interface CTPNearLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation CTPNearLiveCell

-(void)showWithAnimation{
    
    
    if (self.live.isShow) {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);;
        self.live.show = YES;
        
    }];
    
    
}



-(void)setLive:(CTPLive *)live{
    _live = live;
    
    if (self.live.creator.portrait.length > 4) {
        
        NSString *str = [self.live.creator.portrait substringToIndex:4];
        
        NSString *urlStr = [str isEqualToString:@"http"]?self.live.creator.portrait:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,self.live.creator.portrait];
        
        [self.headView downloadImage:urlStr placeholder:@"default_room"];
    }else{
        [self.headView downloadImage:self.live.creator.portrait placeholder:@"default_room"];
    }
    
    self.distanceLabel.text = live.distance;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
