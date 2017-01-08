//
//  CTPLiveTableViewCell.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/6.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLiveTableViewCell.h"


@interface CTPLiveTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation CTPLiveTableViewCell

-(void)setLive:(CTPLive *)live{
    
    _live = live;
    
    

    if ([live.creator.portrait isEqualToString:@"touxiang"]) {
        self.headView.image = [UIImage imageNamed:live.creator.portrait];
        self.bigImageView.image = [UIImage imageNamed:@"touxiang"];
    }else{
        if (live.creator.portrait.length > 4) {
            NSString *str = [live.creator.portrait substringToIndex:4];
            if ([str isEqualToString:@"http"]) {
                [self.headView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
                
                [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
            }else{
                [self.headView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
                
                [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
            }
        }
        
    }
    
    
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineLabel.text = [@(live.onlineUsers) stringValue];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.headView.layer.cornerRadius = 25;
//    self.headView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
