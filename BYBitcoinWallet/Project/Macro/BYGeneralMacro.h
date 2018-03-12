//
//  BYGeneralMacro.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/5/11.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#ifndef BYGeneralMacro_h
#define BYGeneralMacro_h

// screen size
#ifndef BYScreen_width
#define BYScreen_width  ([[UIScreen mainScreen]bounds].size.width)
#endif
#ifndef BYScreen_height
#define BYScreen_height ([[UIScreen mainScreen]bounds].size.height)
#endif
#ifndef BYScreen_scale
#define BYScreen_scale  ([UIScreen mainScreen].scale)
#endif

// string format
#ifndef BYFormat
#define BYFormat(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#endif

#define BYClassName(a) [NSString stringWithUTF8String:object_getClassName([a class])]

// block
#define BYMain(block)  if ([NSThread isMainThread]) {\
block();\
}else{\
dispatch_async(dispatch_get_main_queue(),block);\
}
#define BYMainDelay(x, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(x * NSEC_PER_SEC)), dispatch_get_main_queue(), block)
#define BYBack(block)  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define BYCall(block,...) !block?:block(__VA_ARGS__);
#define BYCallRerurn(block,failReturnValue,...) \
block?(block(__VA_ARGS__)):(failReturnValue)

// font
#ifndef BYSystemFont
#define BYSystemFont(a)     [UIFont systemFontOfSize:by_autoResize(a)]
#endif
#ifndef BYBoldFont
#define BYBoldFont(a)       [UIFont boldSystemFontOfSize:by_autoResize(a)]
#endif
#ifndef BYCustomFont
#define BYCustomFont(a)  [UIFont fontWithName:@"iconfont" size:by_autoResize(a)]
#endif

// color
#ifndef BYSystemColor
#define BYSystemColor(a)  [UIColor a]
#endif
#ifndef BYCustomColor
#define BYCustomColor(a)  [UIColor by_colorWithHexString:a]
#endif

#endif /* BYGeneralMacro_h */

NS_ASSUME_NONNULL_BEGIN

static inline BOOL BYIsEmpty(id _Nullable obj) {
    return obj == nil
    || (NSNull *)obj == [NSNull null]
    || ([obj respondsToSelector:@selector(length)] && [obj length] == 0)
    || ([obj respondsToSelector:@selector(count)] && [obj count] == 0);
}

static inline NSString *BYAvailableString (NSString *_Nullable obj) {
    return BYIsEmpty(obj) ? @"" : BYFormat(@"%@", obj);
}

static inline NSNumber *BYAvailableNumber (NSNumber *_Nullable obj) {
    return BYIsEmpty(obj) ? [NSNumber numberWithInt:0] : obj;
}

static inline NSArray *BYAvailableArray (NSArray *_Nullable obj) {
    return BYIsEmpty(obj) ? [NSArray array] : obj;
}

static inline NSDictionary *BYAvailableDictionary (NSDictionary *_Nullable obj) {
    return BYIsEmpty(obj) ? [NSDictionary dictionary] : obj;
}

static inline NSString *PBDefaultString (NSString *_Nullable obj, NSString *_Nullable defaultStr) {
    return BYIsEmpty(obj) ? defaultStr : BYFormat(@"%@", obj);
}

static inline NSString *BYDefaultString (NSString *_Nullable obj) {
    return BYIsEmpty(obj) ? @"暂无" : BYFormat(@"%@", obj);
}

static inline NSString *BYZeroString (NSString *_Nullable obj) {
    return BYIsEmpty(obj) ? @"0" : BYFormat(@"%@", obj);
}

static inline NSNumber *BYDefaultNumber (NSNumber *_Nullable obj) {
    return BYIsEmpty(obj) ? [NSNumber numberWithInt:-1] : obj;
}

//make the last line cell's seperate line for each section display to head
static inline void by_makeCellSeperatorLineTopGrid(UITableViewCell *cell){
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:true];
    }
}

//auto simple resize to adjust device screen size
static inline CGFloat pb_autoResize(CGFloat size, NSString *baseMode) {
    NSDictionary *tmp = @{@"5":@"320",@"6":@"375",@"6+":@"414",@"7":@"375",@"7+":@"414"};
    NSString *sizeString = [tmp objectForKey:baseMode];
    if (BYIsEmpty(sizeString)) {
        return size;
    }
    return (size * BYScreen_width) / sizeString.floatValue;
}

static inline NSInteger by_autoResize(CGFloat size) {
    return (size * BYScreen_width) / 375.0f;
}

static inline BOOL PBValiMobile(NSString *mobile) {
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11) {
        return NO;
    } else {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        } else {
            return NO;
        }
    }
}

NS_ASSUME_NONNULL_END
