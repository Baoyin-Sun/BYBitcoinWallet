//
//  UIView+Frame.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

@dynamic width,height,originX,originY;

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)originX {
    return CGRectGetMinX(self.frame);
}

- (void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (CGFloat)originY {
    return CGRectGetMinY(self.frame);
}

- (void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
