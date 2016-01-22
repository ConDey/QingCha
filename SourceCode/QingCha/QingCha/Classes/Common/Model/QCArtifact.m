//
//  Artifact.m
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCArtifact.h"

// 相关常量
#define AID            @"aid"
#define TITLE          @"title"
#define INTRODUCTION   @"introduction"
#define AUTHOR         @"author"
#define SOURCE         @"source"
#define VISITNUM       @"visitnum"

@implementation QCArtifact

- (id)initWithDictionary:(NSDictionary *)dict {
    
    if (self = [super init]) {
        self.aid = [dict objectForKey:AID];
        self.title = [dict objectForKey:TITLE];
        self.introduction = [dict objectForKey:INTRODUCTION];
        self.author = [dict objectForKey:AUTHOR];
        self.source = [dict objectForKey:SOURCE];
        self.visitnum = [dict objectForKey:VISITNUM];
        
        // QCBrand
        self.brand = [[QCBrand alloc]initWithDictionary:dict];
    }
    return self;
}

@end
