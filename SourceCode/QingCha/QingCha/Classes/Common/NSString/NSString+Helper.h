//
//  NSString+Helper.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSString工具方法, 创建这个类别的目的是使所有的NSString可以被安全的使用防止空指针
 */
@interface NSString (Helper)


/**
 *  字符串拼接
 *
 *  @param head 字符串头
 *  @param foot 字符串尾
 *
 *  @return 相加后的字符串
 */
+ (NSString *)stringByAppendingHead:(NSString *)head foot:(NSString *)foot;

/**
 *  去除所有的HTML标签
 *
 *  @param html HTML
 *  @param trim 是否空出
 *
 *  @return NSString
 */
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;


/**
 *  比较两个NSString是否相等
 *
 *  @param string  待比较的NSString
 *  @param origin  被比较的NSString
 *
 *  @return  BOOL
 */
+ (BOOL)isEqualToString: (NSString *)string origin: (NSString *)origin;

/**
 *  判断NSString是否为空(包括内容为空)
 *
 *  @param string 被判断的SString
 *
 *  @return BOOL
 */
+ (BOOL)isStringBlank: (NSString *)string;

/**
 *  判断NSString是否为空
 *
 *  @param string 被判断的SString
 *
 *  @return BOOL
 */
+ (BOOL)isStringNil: (NSString *)string;

/**
 *  计算字符串X轴长度
 *
 *  @param string 字符串
 *  @param font   相关属性
 *
 *  @return 字符串X轴长度
 */
+ (CGFloat)widthString:(NSString *)string font:(NSDictionary *)attirbute;

@end
