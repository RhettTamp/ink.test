//
//  CTPLoginViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLoginViewController.h"
#import "UMSocial.h"
#import "CTPUserHelper.h"
#import "CTPTabBarViewController.h"

@interface CTPLoginViewController ()

@end

@implementation CTPLoginViewController

- (IBAction)sinaLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            
//            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);

            [CTPUserHelper sharedUser].nikeName = snsAccount.userName;
            [CTPUserHelper sharedUser].iconUrl = snsAccount.iconURL;
            [CTPUserHelper saveUser];
            
            self.view.window.rootViewController = [[CTPTabBarViewController alloc]init];
            
            
        } else {
            
            NSLog(@"登录失败");
        }
        
    });
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


@end
