//
//  NSNumber+Helper.m
//  QingCha
//
//  Created by eazytec on 16/1/22.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "NSNumber+Helper.h"

@implementation NSNumber (Helper)

+ (BOOL)isNumberNil:(NSNumber *)number {
    if (number == nil || [number isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}


+ (NSNumber *)getNumberWithString:(NSString *)string {
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    if ([format numberFromString:string]) {
        return [NSNumber numberWithInt:[string intValue]];
    }else{
        return [NSNumber numberWithInt:0];
    }
}

+ (NSInteger)integerValue:(NSNumber *)number {
    if ([NSNumber isNumberNil:number]) {
        return 0;
    }
    return [number integerValue];
}

+ (int)intValue:(NSNumber *)number {
    if ([NSNumber isNumberNil:number]) {
        return 0;
    }
    return [number intValue];
}

@end
