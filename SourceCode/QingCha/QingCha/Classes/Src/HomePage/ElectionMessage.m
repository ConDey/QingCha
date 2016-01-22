//
//  ElectionMessage.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ElectionMessage.h"


@implementation ElectionMessage

- (id)initWithHttpMessage:(HttpMessage *)httpMessage {
    
    if ((self = [super initWithHttpMessage:httpMessage]) && [self isSuccess]) {
        [self parseTablePaging:httpMessage]; // 解析分页相关参数
        
        NSArray *array = [httpMessage.content objectForKey:HTTP_LIST];
        NSMutableArray *elections = [[NSMutableArray alloc]init];
        if (![NSArray isArrayNull:array]) {  
            for (NSInteger index = 0; index < array.count; index++) {
                QCElection *election = [[QCElection alloc]initWithDictionary:[array objectAtIndex:index]];
                [elections addObject:election];
            }
        }
        _elections = elections;
    }
    return self;
}

@end
