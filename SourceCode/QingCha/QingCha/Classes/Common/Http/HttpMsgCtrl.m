//
//  HttpMsgCtrl.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "HttpMsgCtrl.h"

@implementation HttpMsgCtrl

+ (instancetype)shareInstance {
    static dispatch_once_t once;
    static HttpMsgCtrl * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[HttpMsgCtrl alloc] init]; } );
    return __singleton__;
}

- (void)request:(HttpMessage *)msg {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    // 暂时测试用
    [dictionary setObject:@"0" forKey:HTTP_CODE];
    [dictionary setObject:@"处理成功" forKey:HTTP_MSG];
    
    if (msg.serviceCode == QC_Election_PageLoading) {
        
        [dictionary setObject:@"1" forKey:HTTP_CURRENT_PAGE];
        [dictionary setObject:@"20" forKey:HTTP_TOTAL_COUNT];
        [dictionary setObject:@"1" forKey:HTTP_TOTAL_PAGE];
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index < 20; index++) {
            NSMutableDictionary *election = [[NSMutableDictionary alloc]init];
            // ============= 模拟数据 ================
            [election setObject:@"E0000001"   forKey:@"eid"];
            [election setObject:@"A0000001"   forKey:@"aid"];
            [election setObject:@"仙果人间都未有,今朝忽见天下门" forKey:@"title"];
            [election setObject:@"唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门." forKey:@"introduction"];
            [election setObject:@"B000001" forKey:@"bid"];
            [election setObject:@"清茶绮香" forKey:@"brandName"];
            [election setObject:@"张释之" forKey:@"author"];
            [election setObject:@"江苏宜兴" forKey:@"source"];
            [election setObject:@"1016" forKey:@"visitnum"];
            // ============= 模拟数据 ================
            [array addObject:election];
        }
        [dictionary setObject:array forKey:HTTP_LIST];
        msg.content = dictionary;
        [msg.delegate receiveDidFinished:msg];
    }
}

@end
