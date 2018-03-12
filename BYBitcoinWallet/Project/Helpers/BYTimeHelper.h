//
//  BYTimeHelper.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/31.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYTimeHelper : NSObject

//时间戳转字符串
+ (NSString *)stringFromTimeStamp:(NSString *)timeStr dateFormat:(NSString *)formatStr;

//字符串转换时间戳
+ (NSString *)timeStampFromString:(NSString *)dateStr dateFormat:(NSString *)formatStr;

//获取当前时间戳
+ (NSString *)getCurrentTimestamp;

//获取两周后时间戳
+ (NSString *)getTwoWeeksLaterTimestamp;

//获取一年后时间戳
+ (NSString *)getOneYearsLaterTimestamp;

//获取当前时间
+ (NSString *)getCurrentTimestamp:(NSString *)formatString;

//获取明天当前时间
+ (NSString *)getTomorrowCurrentTimestamp:(NSString *)format;

//显示距离当前的时间
+ (NSString *)getDateDisplayString:(long long) miliSeconds;

//获取星期
+ (NSString *)getWeekDayWithDate:(NSDate *)date;

/**
 *  字符串转NSDate
 *
 *  @param timeStr 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return NSDate
 */
+ (NSDate *)dateFromString:(NSString *)timeStr format:(NSString *)format;
+ (NSDate *)stringToDate:(NSString *)str;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)dateStrFromDate:(NSDate *)date withDateFormat:(NSString *)format;

//根据日期计算年龄
+ (NSString *)dateToDetailOld:(NSDate *)bornDate;

@end
