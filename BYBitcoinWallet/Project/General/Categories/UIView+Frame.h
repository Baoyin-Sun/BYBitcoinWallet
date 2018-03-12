//
//  UIView+Frame.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property(nonatomic, assign)CGFloat      width;
@property(nonatomic, assign)CGFloat      height;
@property(nonatomic, assign)CGFloat      originX;
@property(nonatomic, assign)CGFloat      originY;
@property(nonatomic, assign)CGFloat      centerX;
@property(nonatomic, assign)CGFloat      centerY;
@property(nonatomic, assign)CGPoint      origin;
@property(nonatomic, assign)CGSize       size;

@property(nonatomic,readonly)CGFloat      maxX;
@property(nonatomic,readonly)CGFloat      maxY;

@end
