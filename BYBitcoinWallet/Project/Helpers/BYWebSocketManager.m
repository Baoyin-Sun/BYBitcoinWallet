//
//  BYWebSocketManager.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/31.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYWebSocketManager.h"
#import "SRWebSocket.h"

@interface BYWebSocketManager () <SRWebSocketDelegate>

@property (nonatomic, strong) SRWebSocket *webSocket;
@property (nonatomic, assign) BYSocketStatus by_socketStatus;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, copy) NSString *urlString;

@end

@implementation BYWebSocketManager {
    NSInteger _reconnectCounter;
}

+ (instancetype)shareManager {
    static BYWebSocketManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.overtime = 1;
        instance.reconnectCount = 5;
    });
    return instance;
}

- (void)by_open:(NSString *)urlStr connect:(BYSocketDidConnectBlock)connect receive:(BYSocketDidReceiveBlock)receive failure:(BYSocketDidFailBlock)failure {
    [BYWebSocketManager shareManager].connect = connect;
    [BYWebSocketManager shareManager].receive = receive;
    [BYWebSocketManager shareManager].failure = failure;
    [self by_open:urlStr];
}

- (void)by_close:(BYSocketDidCloseBlock)close {
    [BYWebSocketManager shareManager].close = close;
    [self by_close];
}

// Send a UTF8 String or Data.
- (void)by_send:(id)data {
    switch ([BYWebSocketManager shareManager].by_socketStatus) {
        case BYSocketStatusConnected:
        case BYSocketStatusReceived: {
            NSLog(@"发送中。。。");
            [self.webSocket send:data];
            break;
        }
        case BYSocketStatusFailed:
            NSLog(@"发送失败");
            break;
        case BYSocketStatusClosedByServer:
            NSLog(@"已经关闭");
            break;
        case BYSocketStatusClosedByUser:
            NSLog(@"已经关闭");
            break;
    }
}

#pragma mark -- private method
- (void)by_open:(id)params {
    //    NSLog(@"params = %@",params);
    NSString *urlStr = nil;
    if ([params isKindOfClass:[NSString class]]) {
        urlStr = (NSString *)params;
    } else if ([params isKindOfClass:[NSTimer class]]) {
        NSTimer *timer = (NSTimer *)params;
        urlStr = [timer userInfo];
    }
    [BYWebSocketManager shareManager].urlString = urlStr;
    [self.webSocket close];
    self.webSocket.delegate = nil;
    
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    self.webSocket.delegate = self;
    
    [self.webSocket open];
}

- (void)by_close {
    [self.webSocket close];
    self.webSocket = nil;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)by_reconnect {
    // 计数+1
    if (_reconnectCounter < self.reconnectCount - 1) {
        _reconnectCounter ++;
        // 开启定时器
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.overtime target:self selector:@selector(by_open:) userInfo:self.urlString repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    } else {
        NSLog(@"Websocket Reconnected Outnumber ReconnectCount");
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        return;
    }
}

#pragma mark -- SRWebSocketDelegate
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"Websocket Connected");
    
    [BYWebSocketManager shareManager].connect ? [BYWebSocketManager shareManager].connect() : nil;
    [BYWebSocketManager shareManager].by_socketStatus = BYSocketStatusConnected;
    // 开启成功后重置重连计数器
    _reconnectCounter = 0;
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@":( Websocket Failed With Error %@", error);
    [BYWebSocketManager shareManager].by_socketStatus = BYSocketStatusFailed;
    [BYWebSocketManager shareManager].failure ? [BYWebSocketManager shareManager].failure(error) : nil;
    // 重连
    [self by_reconnect];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@":( Websocket Receive With message %@", message);
    [BYWebSocketManager shareManager].by_socketStatus = BYSocketStatusReceived;
    [BYWebSocketManager shareManager].receive ? [BYWebSocketManager shareManager].receive(message,BYSocketReceiveTypeForMessage) : nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"Closed Reason:%@  code = %zd",reason,code);
    if (reason) {
        [BYWebSocketManager shareManager].by_socketStatus = BYSocketStatusClosedByServer;
        // 重连
        [self by_reconnect];
    } else {
        [BYWebSocketManager shareManager].by_socketStatus = BYSocketStatusClosedByUser;
    }
    [BYWebSocketManager shareManager].close ? [BYWebSocketManager shareManager].close(code,reason,wasClean) : nil;
    self.webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    [BYWebSocketManager shareManager].receive ? [BYWebSocketManager shareManager].receive(pongPayload,BYSocketReceiveTypeForPong) : nil;
}

- (void)dealloc {
    // Close WebSocket
    [self by_close];
}

@end
