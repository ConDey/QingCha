//
//  QCBrand.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCBrand.h"

// 相关常量
#define BID            @"bid"
#define NAME           @"name"
#define INTRODUCTION   @"introduction"

@implementation QCBrand


- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.bid  = [dict objectForKey:BID];
        self.name = [dict objectForKey:NAME];
        self.introduction = [dict objectForKey:INTRODUCTION];
    }
    return self;
}

@end
