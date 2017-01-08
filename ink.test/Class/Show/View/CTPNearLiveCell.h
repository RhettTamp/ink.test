//
//  CTPNearLiveCell.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/9.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTPLive.h"


@interface CTPNearLiveCell : UICollectionViewCell

@property (nonatomic,strong) CTPLive *live;

-(void)showWithAnimation;

@end
