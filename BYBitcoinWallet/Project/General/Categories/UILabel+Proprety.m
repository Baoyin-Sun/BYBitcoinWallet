//
//  UILabel+Proprety.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/30.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "UILabel+Proprety.h"

@implementation UILabel (Proprety)

+ (UILabel *)label {
    UILabel *label = [[UILabel alloc] init];
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font {
    UILabel *label = [self label];
    label.font = font;
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor {
    UILabel *label = [self labelWithFont:font];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [self labelWithFont:font textColor:textColor];
    label.numberOfLines = numberOfLines;
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
                 alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [self labelWithFont:font textColor:textColor numberOfLines:numberOfLines];
    label.textAlignment = alignment;
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             numberOfLines:(NSInteger)numberOfLines
                 alignment:(NSTextAlignment)alignment
           backgroundcolor:(UIColor *)backgroundcolor {
    UILabel *label = [self labelWithFont:font textColor:textColor numberOfLines:numberOfLines alignment:alignment];
    label.backgroundColor = backgroundcolor;
    return label;
}

@end
