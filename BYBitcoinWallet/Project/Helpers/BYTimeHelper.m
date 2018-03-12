//
//  BYTimeHelper.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/31.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYTimeHelper.h"

@implementation BYTimeHelper

//时间戳转字符串
+ (NSString *)stringFromTimeStamp:(NSString *)timeStr dateFormat:(NSString*)formatStr {
    NSTimeInterval tempMilli = [timeStr longLongValue];
    NSTimeInterval seconds = tempMilli / 1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    dateFmt.dateFormat = formatStr;
    return [dateFmt stringFromDate:myDate];
}

//字符串转时间戳
+ (NSString *)timeStampFromString:(NSString *)dateStr dateFormat:(NSString *)formatStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    NSDate *date = [formatter dateFromString:dateStr];
    NSTimeInterval timeInterval = [date timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%.f", timeInterval];
}

//获取当前时间戳
+ (NSString *)getCurrentTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    return [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970] * 1000)];
}

//获取两周后时间戳
+ (NSString *)getTwoWeeksLaterTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:24*60*60*14];
    return [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970] * 1000)];
}

//获取一年后时间戳
+ (NSString *)getOneYearsLaterTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:365*24*60*60];
    return [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970] * 1000)];
}

//获取当前时间
+ (NSString *)getCurrentTimestamp:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *timestamp = [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970] * 1000)];
    return [BYTimeHelper stringFromTimeStamp:timestamp dateFormat:format];
}

//获取明天当前时间
+ (NSString *)getTomorrowCurrentTimestamp:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSString *timestamp = [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970] * 1000)];
    return [BYTimeHelper stringFromTimeStamp:timestamp dateFormat:format];
}

//显示距离当前的时间
+ (NSString *)getDateDisplayString:(long long) miliSeconds {
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli / 1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date ]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:myDate];
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init ];
    if (nowCmps.year != myCmps.year) {
        dateFmt.dateFormat = @"yyyy-MM-dd HH:mm";
    } else {
        if (nowCmps.day == myCmps.day) {
            dateFmt.dateFormat = @"今天 HH:mm";
        } else if((nowCmps.day-myCmps.day)==1) {
            dateFmt.dateFormat = @"昨天 HH:mm";
        } else {
            dateFmt.dateFormat = @"MM-dd HH:mm";
        }
    }
    return [dateFmt stringFromDate:myDate];
}

//获取星期
+ (NSString *)getWeekDayWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"UTC+8"]];
    [greCalendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    NSDateComponents *dateComponents = [greCalendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:date];
    switch (dateComponents.weekday) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
        default:
            return @"";
            break;
    }
}

//字符串转NSDate
+ (NSDate *)dateFromString:(NSString *)timeStr format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:timeStr];
    return date;
}

+ (NSDate *)stringToDate:(NSString *)str {
    NSTimeInterval time = ([str doubleValue] + 28800) / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}

//NSDate转字符串
+ (NSString *)dateStrFromDate:(NSDate *)date withDateFormat:(NSString *)format {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}

//根据日期计算年龄
+ (NSString *)dateToDetailOld:(NSDate *)bornDate {
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //创建日历(格里高利历)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //设置component的组成部分
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //按照组成部分格式计算出生日期与现在时间的时间间隔
    NSDateComponents *date = [calendar components:unitFlags fromDate:bornDate toDate:currentDate options:0];
    //判断年龄大小,以确定返回格式
    if ([date year] > 5) {
        return BYFormat(@"%ld岁", (long)[date year]);
    } else if ([date year] > 0) {
        return BYFormat(@"%ld岁%ld月", (long)[date year], (long)[date month]);
    } else if ([date month] > 0) {
        return BYFormat(@"%ld月%ld天", (long)[date month], (long)[date day] + 1);
    } else if ([date day] > 0) {
        return BYFormat(@"%ld天", (long)[date day] + 1);
    } else {
        return @"1天";
    }
}

@end
