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
        [dictionary setObject:@"5" forKey:HTTP_TOTAL_COUNT];
        [dictionary setObject:@"1" forKey:HTTP_TOTAL_PAGE];
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index < 5; index++) {
            NSMutableDictionary *election = [[NSMutableDictionary alloc]init];
            // ============= 模拟数据 ================
            [election setObject:@"E0000001"   forKey:@"eid"];
            [election setObject:@"A0000001"   forKey:@"aid"];
            [election setObject:@"仙果人间都未有，今朝忽见天下门" forKey:@"title"];
            [election setObject:@"唐代张籍有诗曰:仙果人间都未有,今朝忽见天下门." forKey:@"introduction"];
            [election setObject:@"B000001" forKey:@"bid"];
            [election setObject:@"清茶绮香" forKey:@"bname"];
            [election setObject:@"张释之" forKey:@"author"];
            [election setObject:@"江苏宜兴" forKey:@"source"];
            [election setObject:@"1016" forKey:@"visitnum"];
            // ============= 模拟数据 ================
            [array addObject:election];
        }
        [dictionary setObject:array forKey:HTTP_LIST];
    }
    
    else if (msg.serviceCode == QC_TopBrand_Loading) {
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index < 4; index++) {
            NSMutableDictionary *brand = [[NSMutableDictionary alloc]init];
            // ============= 模拟数据 ================
            [brand setObject:@"B0000001"   forKey:@"bid"];
            if (index == 0) {
                [brand setObject:@"春观夜樱" forKey:@"name"];
            }else if (index == 1) {
                [brand setObject:@"夏望星辰" forKey:@"name"];
            }else if (index == 2) {
                [brand setObject:@"秋赏明月" forKey:@"name"];
            }else {
                [brand setObject:@"冬会白雪" forKey:@"name"];
            }
            
            [brand setObject:@"清茶绮香庚子年一月。紫砂器的泥色有多种，除去主要的朱泥、紫砂泥外，尚有白泥、乌泥、黄泥、松花泥等各种色泽，紫砂器面还具有亚光效果，既可减弱光能的反射，又能清晰地表现器物形态、装饰与自身天然色泽的生动效果。" forKey:@"introduction"];
            // ============= 模拟数据 ================
            [array addObject:brand];
        }
        [dictionary setObject:array forKey:HTTP_LIST];
    }
    
    else if (msg.serviceCode == QC_Artifacts_Loading) {
        [dictionary setObject:@"1" forKey:HTTP_CURRENT_PAGE];
        [dictionary setObject:@"4" forKey:HTTP_TOTAL_COUNT];
        [dictionary setObject:@"1" forKey:HTTP_TOTAL_PAGE];
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index < 4; index++) {
            NSMutableDictionary *election = [[NSMutableDictionary alloc]init];
            // ============= 模拟数据 ================
            [election setObject:@"A0000001"   forKey:@"aid"];
            [election setObject:@"夏至未至，如冬晓寒" forKey:@"title"];
            [election setObject:@"唐代张籍有诗曰，仙果人间都未有，今朝忽见天下门。唐代张籍有诗曰，仙果人间都未有，今朝忽见天下门。" forKey:@"introduction"];
            [election setObject:@"B000001" forKey:@"bid"];
            [election setObject:@"张释之" forKey:@"author"];
            [election setObject:@"江苏宜兴" forKey:@"source"];
            [election setObject:@"1016" forKey:@"visitnum"];
            // ============= 模拟数据 ================
            [array addObject:election];
        }
        [dictionary setObject:array forKey:HTTP_LIST];
    }
    
    msg.content = dictionary;
    [msg.delegate receiveDidFinished:msg];
}

@end
