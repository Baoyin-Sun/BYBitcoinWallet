//
//  NSArray+ClassProperty.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ClassProperty)

+ (instancetype)getProperties:(Class)cls;

@end
