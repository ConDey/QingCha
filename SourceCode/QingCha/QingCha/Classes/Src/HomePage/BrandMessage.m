//
//  BrandMessage.m
//  QingCha
//
//  Created by eazytec on 16/2/1.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "BrandMessage.h"

@implementation BrandMessage

- (id)initWithHttpMessage:(HttpMessage *)httpMessage {
    if ((self = [super initWithHttpMessage:httpMessage]) && [self isSuccess]) {
        [self parseTablePaging:httpMessage]; // 解析分页相关参数
        
        NSArray *array = [httpMessage.content objectForKey:HTTP_LIST];
        NSMutableArray *brands = [[NSMutableArray alloc]init];
        if (![NSArray isArrayNull:array]) {
            for (NSInteger index = 0; index < array.count; index++) {
                QCBrand *brand = [[QCBrand alloc]initWithDictionary:[array objectAtIndex:index]];
                [brands addObject:brand];
            }
        }
        _brands = brands;
    }
    return self;
}

@end
