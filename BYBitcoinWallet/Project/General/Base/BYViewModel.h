//
//  BYViewModel.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/8/31.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYRequest.h"

typedef enum : NSUInteger {
    BYHeaderRefresh_HasMoreData = 1,
    BYHeaderRefresh_HasNoMoreData,
    BYFooterRefresh_HasMoreData,
    BYFooterRefresh_HasNoMoreData,
    BYRefreshError,
    BYRefreshUI,
} BYRefreshDataStatus;

@protocol BYViewModelProtocol <NSObject>

@optional
- (instancetype)initWithModel:(id)model;

@property (strong, nonatomic) BYRequest *request;
/**
 *  初始化
 */
- (void)by_initialize;

@end

@interface BYViewModel : NSObject <BYViewModelProtocol>
typedef void (^NextBlock)(NSDictionary *);

typedef RACSignal *(^SignalBlock)(id);
typedef RACDisposable *(^DisposableBlock)(id<RACSubscriber>);
@end
