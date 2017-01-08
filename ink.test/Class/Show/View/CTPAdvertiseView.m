//
//  CTPAdvertiseView.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/9.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPAdvertiseView.h"
#import "CTPLiveHandler.h"
#import "CTPAdvertise.h"
#import "CTPCachHelper.h"
#import "SDWebImageManager.h"

#define advertiseImage @"adImage"

@interface CTPAdvertiseView ()

@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation CTPAdvertiseView

+(instancetype)loadAdvertiseView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"CTPAdvertiseView" owner:self options:nil] firstObject];
    
}

-(void)awakeFromNib{
    
    self.frame = [UIScreen mainScreen].bounds;
    
    //展示广告
    [self showAdvertise];
    //下载广告
    [self downAdvertise];
    //倒计时
    [self startTimer];
    [super awakeFromNib];
}

-(void)showAdvertise{
    
    
    [[SDImageCache sharedImageCache] queryCacheOperationForKey:advertiseImage done:^(UIImage * _Nullable image, NSData * _Nullable data, SDImageCacheType cacheType) {
        
        if (image) {
            self.backView.image = image;
        }else{
            self.hidden = YES;
        }
        
        
    }];

    
}

-(void)downAdvertise{
    
    //获取最新广告数据
    [CTPLiveHandler executeGetAdvertiseTaskWithSuccess:^(id obj) {

        CTPAdvertise *ad = obj;
        
        if (ad.image.length > 4) {
            NSString *str = [ad.image substringToIndex:4];
            
            NSString *urlStr = [str isEqualToString:@"http"]?ad.image:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image];
            
            NSURL *imageUrl = [NSURL URLWithString:urlStr];
            
            
            SDWebImageDownloader *d = [SDWebImageDownloader sharedDownloader];
            
            [d downloadImageWithURL:imageUrl options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                
                [[SDImageCache sharedImageCache]storeImage:image forKey:advertiseImage completion:nil];
                
                //[CTPCachHelper setAdvertise:ad.image];
                NSLog(@"%@",image);
                NSLog(@"片下载成功");
            }];
        }
        
        
        
        
        
    
    }faild:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)startTimer{
    
    __block NSUInteger timeout = 3;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (timeout <= 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dissmiss];
            });
            
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeLabel.text = [NSString stringWithFormat:@"跳过%zd",timeout--];            });
        }
        
    });
    dispatch_resume(timer);
    
    
}

-(void)dissmiss{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0.f;
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


@end
