//
//  BYRequest.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <Reachability.h>

@class BYRequest;
@protocol BYRequestDelegate <NSObject>

- (void)BYRequest:(BYRequest *)request finished:(NSDictionary *)response;
- (void)BYRequest:(BYRequest *)request Error:(NSString *)error;

@end

@interface BYRequest : NSObject

@property (nonatomic, assign) NetworkStatus netStatus;

@property (assign) id <BYRequestDelegate> delegate;

/**
 *[AFNetWorking]的operationManager对象
 */
@property (nonatomic, strong) AFHTTPSessionManager* operationManager;

/**
 *当前的请求operation队列
 */
@property (nonatomic, strong) NSOperationQueue* operationQueue;

/**
 *当前的请求超时时间
 */
@property (nonatomic, assign) NSInteger kRequestOut;

/**
 *功能: 创建BYRequest的对象方法
 */
+ (instancetype)request;

/**
 *功能：GET请求
 *参数：(1)请求的url: urlString
 *     (2)请求成功调用的Block: success
 *     (3)请求失败调用的Block: failure
 */
- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
    success:(void (^)(BYRequest *request, NSDictionary *responseDict))handleSuccess
    failure:(void (^)(BYRequest *request, NSError *error))handleFailure;

/**
 *功能：POST请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 *     (3)请求成功调用的Block: success
 *     (4)请求失败调用的Block: failure
 */
- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(BYRequest *request, NSDictionary *responseDict))handleSuccess
     failure:(void (^)(BYRequest *request, NSError *error))handleFailure;

- (void)POSTWithIdParams:(NSString *)URLString
              parameters:(NSDictionary*)parameters
                 success:(void (^)(BYRequest *request, NSDictionary* responseString))handleSuccess
                 failure:(void (^)(BYRequest *request, NSError *error))handleFailure;

/**
 *功能：POST请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 (3)上传文件参数:data
 *     (4)请求成功调用的Block: success
 *     (5)请求失败调用的Block: failure
 */
- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
  uploadData:(NSData *)data
    fileName:(NSString *)fileName
     success:(void (^)(BYRequest *request, NSDictionary *responseDict))handleSuccess
     failure:(void (^)(BYRequest *request, NSError *error))handleFailure;

/**
 *  post请求
 *
 *  @param URLString  请求网址
 *  @param parameters 请求参数
 */
- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  get 请求
 *
 *  @param URLString 请求网址
 */
- (void)getWithURL:(NSString *)URLString;

/**
 *取消当前请求队列的所有请求
 */
- (void)cancelAllOperations;

@end
