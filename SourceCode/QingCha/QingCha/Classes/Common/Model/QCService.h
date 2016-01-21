//
//  QCService.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HttpMsgCtrl.h"

// 基础数据服务模型

@interface QCService : NSObject<HttpResponseDelegate>

@property (weak, nonatomic, readonly) HttpMsgCtrl *httpMsgCtrl;

@end
