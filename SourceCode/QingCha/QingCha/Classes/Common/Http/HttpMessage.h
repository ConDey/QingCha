//
//  HttpMessage.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpResponseDelegate;

typedef enum {
    RequestMethodPost        = 0,
    RequestMethodGet         = 1,

} RequestMethod;  // 数据请求信息的包装类型

@interface HttpMessage : NSObject

@property (nonatomic, weak) id<HttpResponseDelegate> delegate;  //服务回调代理

@property (nonatomic, assign) SERVICE_CODE serviceCode;
@property (nonatomic, retain) NSString *requestUrl;
@property (nonatomic, retain) NSDictionary *dataDic;
@property (nonatomic, assign) RequestMethod requestMethod;  //默认post方式
@property (nonatomic, assign) BOOL isHttps; // 默认非https协议

// 返回的相关信息
@property (nonatomic,assign) RESULT_CODE resultCode;
@property (nonatomic,retain) NSString *resultMsg;
@property (nonatomic,retain) NSDictionary *content;  // 信息实体key:value

/*!
 @method        initWithDelegate:requestUrl:postDataDic:serivceCode:
 @abstract      初始化方法，参数为必须字段
 @param         delegate  接收回调方法的代理
 @param         url       发送请求的url
 @param         dataDic   发送请求的参数
 @param         code      该请求的唯一标识
 @result        HttpMessage对象
 */
- (id)initWithDelegate:(id<HttpResponseDelegate>)delegate
           postDataDic:(NSDictionary *)dataDic
           serivceCode:(SERVICE_CODE)code;


/*!
 @method        cancelDelegate
 @abstract      取消代理
 */
- (void)cancelDelegate;


/*!
 @method        cancelDelegateAndCancel
 @abstract      取消代理，并取消对应的Http请求
 */
- (void)cancelDelegateAndCancel;

@end

#pragma mark delegate_
/*!
 @protocol       HttpResponseDelegate
 @abstract       HttpMessage的一个代理
 @discussion     代理模式
 */
@protocol HttpResponseDelegate<NSObject>

@optional

/*!
 @method        receiveDidFinished
 @abstract      请求完成（请求有返回）后的回调方法
 @discussion    代理类中实现
 @param         receiveMsg  HttpMessage对象
 */
- (void)receiveDidFinished:(HttpMessage *)receiveMsg;


/*!
 @method        receiveDidFailed
 @abstract      请求失败（超时，网络未链接等错误）后的回调方法
 @discussion    代理类中实现
 @param         receiveMsg  HttpMessage对象
 */
- (void)receiveDidFailed:(HttpMessage *)receiveMsg;

@end
