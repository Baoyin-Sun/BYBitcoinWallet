//
//  UIButton+Property.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/30.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Property)

@property (nonatomic, copy) void (^clickBlock)(void);

+ (UIButton *)buttonWithType:(UIButtonType)buttonType;

+ (UIButton *)buttonWithType:(UIButtonType)buttonType
                        font:(UIFont *)font;

+ (UIButton *)buttonWithType:(UIButtonType)buttonType
                        font:(UIFont *)font
                   textColor:(UIColor *)textColor;

+ (UIButton *)buttonWithType:(UIButtonType)buttonType
                        font:(UIFont *)font
                   textColor:(UIColor *)textColor
             backgroundcolor:(UIColor *)backgroundcolor;
@end
/*
 font
 title
 titleColor
 
 */
