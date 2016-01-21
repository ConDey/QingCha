//
//  NSArray+Helper.m
//  QingCha
//
//  Created by eazytec on 16/1/19.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)

+ (BOOL)isArrayNull :(NSArray *)array {
    
    if(array == nil  || [(NSNull *)array isEqual:([NSNull null])] ){
        return true;
    }
    return false;
}

@end
