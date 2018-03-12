//
//  BYWebSocketManager.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/31.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  socket状态
 */
typedef NS_ENUM(NSInteger,BYSocketStatus){
    BYSocketStatusConnected,        // 已连接
    BYSocketStatusFailed,           // 失败
    BYSocketStatusClosedByServer,   // 系统关闭
    BYSocketStatusClosedByUser,     // 用户关闭
    BYSocketStatusReceived          // 接收消息
};

/**
 *  消息类型
 */
typedef NS_ENUM(NSInteger,BYSocketReceiveType){
    BYSocketReceiveTypeForMessage,
    BYSocketReceiveTypeForPong
};

/**
 *  连接成功回调
 */
typedef void(^BYSocketDidConnectBlock)(void);

/**
 *  失败回调
 */
typedef void(^BYSocketDidFailBlock)(NSError *error);

/**
 *  关闭回调
 */
typedef void(^BYSocketDidCloseBlock)(NSInteger code,NSString *reason,BOOL wasClean);

/**
 *  消息接收回调
 */
typedef void(^BYSocketDidReceiveBlock)(id message ,BYSocketReceiveType type);

@interface BYWebSocketManager : NSObject

/**
 *  连接回调
 */
@property (nonatomic, copy) BYSocketDidConnectBlock connect;

/**
 *  接收消息回调
 */
@property (nonatomic, copy) BYSocketDidReceiveBlock receive;

/**
 *  失败回调
 */
@property (nonatomic, copy) BYSocketDidFailBlock failure;

/**
 *  关闭回调
 */
@property (nonatomic, copy) BYSocketDidCloseBlock close;

/**
 *  当前的socket状态
 */
@property (nonatomic, assign, readonly) BYSocketStatus by_socketStatus;

/**
 *  超时重连时间，默认1秒
 */
@property (nonatomic, assign) NSTimeInterval overtime;

/**
 *  重连次数,默认5次
 */
@property (nonatomic, assign) NSUInteger reconnectCount;

/**
 *  单例调用
 */
+ (instancetype)shareManager;

/**
 *  开启socket
 *
 *  @param urlStr  服务器地址
 *  @param connect 连接成功回调
 *  @param receive 接收消息回调
 *  @param failure 失败回调
 */
- (void)by_open:(NSString *)urlStr connect:(BYSocketDidConnectBlock)connect receive:(BYSocketDidReceiveBlock)receive failure:(BYSocketDidFailBlock)failure;

/**
 *  关闭socket
 *
 *  @param close 关闭回调
 */
- (void)by_close:(BYSocketDidCloseBlock)close;

/**
 *  发送消息，NSString 或者 NSData
 *
 *  @param data Send a UTF8 String or Data.
 */
- (void)by_send:(id)data;

@end
