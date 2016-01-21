//
//  Http.h
//  QingCha
//
//  Created by eazytec on 16/1/20.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

// Http协议底层包装类, 使用了AFNetworking基础框架, 封装了一些基本的服务操作

@interface Http : NSObject

/**
 *  标准的Http/Https协议请求
 *
 *  @param url     服务URL请求地址
 *  @param dict    服务请求参数
 *  @param https   http/https标识
 *  @param success 请求成功处理方法
 *  @param failure 请求失败处理方法
 *
 *  @return AFHTTPRequestOperationManager
 */
+ (AFHTTPRequestOperationManager *)sendHttpRequest:(NSString*)url
                                   urlParams:(NSDictionary *)dict
                                   isHttps:(BOOL)https
                                   sucessCallback:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                   failCallback:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
