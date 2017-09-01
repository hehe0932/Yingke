//
//  CLSLocationManager.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface CLSLocationManager()<CLLocationManagerDelegate>
/** 定位对象*/
@property (nonatomic,strong)CLLocationManager *locationManager;
@property (nonatomic,copy)LocationBlock locationBlock;
@end
@implementation CLSLocationManager

+ (instancetype)sharedManager{
    static CLSLocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[CLSLocationManager alloc]init];
        }
        
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locationManager = [[CLLocationManager alloc]init];
        //设置精准度,精准度越高越费电
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置精准度刷新频率,单位是米
        _locationManager.distanceFilter = 100;
        _locationManager.delegate = self;
        
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"请开启定位服务");
        }else{
            //获取当前定位状态
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            //用户没允许定位服务
            if (status == kCLAuthorizationStatusNotDetermined) {
                //iOS8之后,需要用户同意定位.我们需要再info.plist里面设置NSLocationWhenInUseUsageDescription属性
                //提示用户打开服务
                //始终开启定位功能
                //试用期间开启定位服务
                [_locationManager requestWhenInUseAuthorization];
            }
        }
        
    }
    return self;
}

- (void)getGps:(LocationBlock)locationBlokc{
    
    _locationBlock = locationBlokc;
    [self.locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation * currentLocation = [locations lastObject];
 
    NSString *lat = [NSString stringWithFormat:@"%@",@(currentLocation.coordinate.latitude)];
    NSString *lon = [NSString stringWithFormat:@"%@",@(currentLocation.coordinate.longitude)];
    
    [CLSLocationManager sharedManager].lat = lat;
    [CLSLocationManager sharedManager].lon = lon;
    
    self.locationBlock(lat, lon);
    
    [self.locationManager stopUpdatingLocation];
}
@end
