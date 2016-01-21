//
//  HttpMsgCtrl.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

// Http/Https 请求池

@interface HttpMsgCtrl : NSObject

// 工厂方法,取得唯一的实例
+ (instancetype)shareInstance;

/*!
 @abstract      发送一个请求
 @discussion    封装好了请求的参数信息的sendMsg，传递给该方法即可异步发送请求
 @param         msg  封装好了请求的参数信息、和标识的对象
 */
- (void)request:(HttpMessage *)msg;

@end
