//
//  APIConfig.h
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

//http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"

//http://service.ingkee.com/api/live/gettop

#ifndef APIConfig_h
#define APIConfig_h

//信息类服务器地址
#define SERVER_HOST @"http://service.ingkee.com"

//图片类服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"

//热门直播
#define API_HotLive @"api/live/gettop"

//附近的人
#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353

//广告地址
#define API_Advertise @"advertise/get"

//直播地址
#define live_Tanpei @"rtmp://live.hkstv.hk.lxdns.com:1935/live/tanpei"


#endif /* APIConfig_h */
