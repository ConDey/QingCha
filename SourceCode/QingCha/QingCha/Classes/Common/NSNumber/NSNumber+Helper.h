//
//  NSNumber+Helper.h
//  QingCha
//
//  Created by eazytec on 16/1/22.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Helper)


/**
 *  判断Number是否为空
 *
 *  @param number number
 *
 *  @return BOOL
 */
+ (BOOL)isNumberNil:(NSNumber *)number;


/**
 *  根据NSString获取number
 *
 *  @param string string
 *
 *  @return NSNumber
 */
+ (NSNumber *)getNumberWithString:(NSString *)string;

/**
 *  获取number的NSInteger
 *
 *  @param number number
 *
 *  @return NSInteger
 */
+ (NSInteger)integerValue:(NSNumber *)number;


/**
 *  获取number的int
 *
 *  @param number number
 *
 *  @return int
 */
+ (int)intValue:(NSNumber *)number;

@end
