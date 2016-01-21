//
//  QCElection.m
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCElection.h"

@implementation QCElection

// 这里的规则是 品牌Brand + 作者Author + 产地Source
- (NSArray *)tagsDisplay {
    return [[NSArray alloc]initWithObjects:self.brand.name,self.self.author,self.source,nil];
}

@end
