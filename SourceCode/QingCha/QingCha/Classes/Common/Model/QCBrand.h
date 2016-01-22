//
//  QCBrand.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "QCModel.h"

// 品牌模型

@interface QCBrand : QCModel

// bid
@property (nonatomic,retain) NSString *bid;

// 品牌名称
@property (nonatomic,retain) NSString *name;



- (id)initWithDictionary:(NSDictionary *)dict;

@end
