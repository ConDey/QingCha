//
//  QCElection.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCElection.h"

// 相关常量
#define EID            @"eid"

@implementation QCElection

// 这里的规则是 品牌Brand + 作者Author + 产地Source
- (NSArray *)tagsDisplay {
    return [[NSArray alloc]initWithObjects:self.brand.name,self.self.author,self.source,nil];
}

- (id)initWithDictionary:(NSDictionary *)dict {
    
    if (self = [super initWithDictionary:dict]) {
        self.eid = [dict objectForKey:EID]; 
        //初始化QCBrand
        NSMutableDictionary *brandDict = [[NSMutableDictionary alloc]init];
        [brandDict setObject:[dict objectForKey:@"bid"] forKey:@"bid"];
        [brandDict setObject:[dict objectForKey:@"bname"] forKey:@"name"];
        self.brand = [[QCBrand alloc]initWithDictionary:brandDict];
    }
    return self;
}


@end
