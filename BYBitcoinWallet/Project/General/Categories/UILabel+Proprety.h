//
//  UILabel+Proprety.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/30.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Proprety)

+ (UILabel *)label;

+ (UILabel *)labelWithFont:(UIFont *)font;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
                 alignment:(NSTextAlignment)alignment;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
                 alignment:(NSTextAlignment)alignment
           backgroundcolor:(UIColor *)backgroundcolor;

@end


