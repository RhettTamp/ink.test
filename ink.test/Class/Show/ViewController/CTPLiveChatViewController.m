//
//  CTPLiveChatViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/8.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLiveChatViewController.h"
#import "CTPLive.h"

@interface CTPLiveChatViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *peopleCount;



@end

@implementation CTPLiveChatViewController

-(void)setLive:(CTPLive *)live{
    _live = live;
    NSString *str = [self.live.creator.portrait substringToIndex:4];
    
    NSString *urlStr = [str isEqualToString:@"http"]?self.live.creator.portrait:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,self.live.creator.portrait];
    [self.iconView downloadImage:urlStr placeholder:@"default_room"];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        self.peopleCount.text = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)] ;
    } repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
