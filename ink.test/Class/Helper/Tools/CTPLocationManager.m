//
//  CTPLocationManager.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/8.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface CTPLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locManager;
@property (nonatomic,copy)LocationBlock block;

@end


@implementation CTPLocationManager

+ (instancetype)sharedManager{
    
    static CTPLocationManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[CTPLocationManager alloc]init];
    });
    
    return _manager;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locManager = [[CLLocationManager alloc]init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [_locManager setDistanceFilter:100];
        _locManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"开启定位服务");
        }else{
            
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locManager requestWhenInUseAuthorization];
            }
            
        }
        
    }
    return self;
}



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coor = location.coordinate;
   
    NSString *lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    
    [CTPLocationManager sharedManager].lat = lat;
    [CTPLocationManager sharedManager].lon = lon;
    
    self.block(lat,lon);
    
    [self.locManager stopUpdatingLocation];
}

-(void)getGps:(LocationBlock)block{
    
    self.block = block;
    [self.locManager startUpdatingLocation];
}


@end
