//
//  Http.m
//  QingCha
//
//  Created by eazytec on 16/1/20.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "Http.h"

@implementation Http

+ (AFHTTPRequestOperationManager *)sendHttpRequest:(NSString*)url
                                   urlParams:(NSDictionary *)dict
                                   isHttps:(BOOL)https
                                   sucessCallback:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                   failCallback:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
        [manager POST:url parameters:dict success:success failure:failure];
        return manager;
}

@end
