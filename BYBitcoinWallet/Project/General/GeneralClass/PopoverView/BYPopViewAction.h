//
//  BYPopViewAction.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/5.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PopoverViewStyle) {
    PopoverViewStyleDefault = 0,        // 默认风格, 白色
    PopoverViewStyleDark,               // 黑色风格
};

typedef NS_ENUM(NSUInteger, PopoverViewMode) {
    PopoverViewModeDefault = 0,         // 默认模式, 根据文字大小计算宽度
    PopoverViewModeFullScreen,          // 宽度占满屏幕
};

@interface BYPopViewAction : NSObject

@property (nonatomic, strong, readonly) UIImage *image;                         ///< 图标 (建议使用 60pix*60pix 的图片)
@property (nonatomic, copy, readonly) NSString *imageUrl;                       ///< 图标 (建议使用 60pix*60pix 的图片)
@property (nonatomic, copy, readonly) NSString *title;                          ///< 标题
@property (nonatomic, copy, readonly) NSAttributedString *iconAndtitle;         ///<iconFont + 标题
@property (nonatomic, copy, readonly) void(^handler)(BYPopViewAction *action);  ///< 选择回调, 该Block不会导致内存泄露, Block内代码无需刻意去设置弱引用.

+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler;

+ (instancetype)actionWithIconTitle:(NSAttributedString *)iconAndtitle handler:(void (^)(BYPopViewAction *action))handler;

+ (instancetype)actionWithImage:(UIImage *)image title:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler;

+ (instancetype)actionWithImageURL:(NSString *)imageURL title:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler;

@end
