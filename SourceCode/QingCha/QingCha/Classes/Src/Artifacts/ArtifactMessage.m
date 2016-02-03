//
//  ArtifactMessage.m
//  QingCha
//
//  Created by eazytec on 16/2/3.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "ArtifactMessage.h"

@implementation ArtifactMessage

- (id)initWithHttpMessage:(HttpMessage *)httpMessage {
    if ((self = [super initWithHttpMessage:httpMessage]) && [self isSuccess]) {
        [self parseTablePaging:httpMessage]; // 解析分页相关参数
        
        NSArray *array = [httpMessage.content objectForKey:HTTP_LIST];
        NSMutableArray *artifacts = [[NSMutableArray alloc]init];
        if (![NSArray isArrayNull:array]) {
            for (NSInteger index = 0; index < array.count; index++) {
                QCArtifact *artifact = [[QCArtifact alloc]initWithDictionary:[array objectAtIndex:index]];
                [artifacts addObject:artifact];
            }
        }
        _artifacts = artifacts;
    }
    return self;
}

@end
