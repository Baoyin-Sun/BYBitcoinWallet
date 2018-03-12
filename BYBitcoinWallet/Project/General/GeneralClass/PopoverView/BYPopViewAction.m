//
//  BYPopViewAction.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/5.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYPopViewAction.h"

@interface BYPopViewAction ()

@property (nonatomic, strong, readwrite) UIImage *image;                        ///< 图标
@property (nonatomic, copy, readwrite) NSString *imageUrl;                      ///< 标题
@property (nonatomic, copy, readwrite) NSString *title;                         ///< 标题
@property (nonatomic, copy, readwrite) NSAttributedString *iconAndtitle;        ///< 标题
@property (nonatomic, copy, readwrite) void(^handler)(BYPopViewAction *action); ///< 选择回调

@end

@implementation BYPopViewAction

+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler {
    return [self actionWithImage:nil title:title handler:handler];
}

+ (instancetype)actionWithIconTitle:(NSAttributedString *)iconAndtitle handler:(void (^)(BYPopViewAction *action))handler{
    BYPopViewAction *action = [[self alloc] init];
    action.image = nil;
    action.iconAndtitle = iconAndtitle;
    action.handler = handler ? : NULL;
    return action;
}

+ (instancetype)actionWithImage:(UIImage *)image title:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler {
    BYPopViewAction *action = [[self alloc] init];
    action.image = image;
    action.title = title ? : @"";
    action.handler = handler ? : NULL;
    return action;
}

+ (instancetype)actionWithImageURL:(NSString *)imageURL title:(NSString *)title handler:(void (^)(BYPopViewAction *action))handler{
    BYPopViewAction *action = [[self alloc] init];
    action.imageUrl = imageURL;
    action.title = title ? : @"";
    action.handler = handler ? : NULL;
    return action;
}

@end
