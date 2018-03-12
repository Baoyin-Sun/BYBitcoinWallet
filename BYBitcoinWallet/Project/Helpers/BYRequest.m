//
//  BYRequest.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYRequest.h"

@implementation BYRequest

+ (instancetype)request {
    BYRequest *request = [[self alloc] init];
    request.kRequestOut = 30;
    return request;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager = [AFHTTPSessionManager manager];
        self.kRequestOut = 30;
    }
    return self;
}

- (NetworkStatus)netStatus {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    return [reach currentReachabilityStatus];
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
    success:(void (^)(BYRequest *request, NSDictionary *responseDict))handleSuccess
    failure:(void (^)(BYRequest *request, NSError *error))handleFailure
{
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.operationManager.requestSerializer.timeoutInterval = self.kRequestOut;
//    NSString *token = [YBDefultInfoTool sharedInstance].ybToken;
//    [self.operationManager.requestSerializer setValue:BYAvailableString(token) forHTTPHeaderField:@"yb_doctor_token"];
//    [self.operationManager.requestSerializer setValue:@"3" forHTTPHeaderField:@"yb_doctor_client"];
//    [self.operationManager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"yb_doctor_version"];
    
    
    //双向认证 安全设置
    AFSecurityPolicy *sec_policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    sec_policy.allowInvalidCertificates = true;//
    sec_policy.validatesDomainName = false;//验证域名
    
    self.operationManager.securityPolicy = sec_policy;
    
//    NSDictionary* param = [[BYRequestHelper sharedInstance] parametersWithDictionary:parameters];
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self.operationManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //
        //NSLog(@"%@", downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSDictionary *responseDict = [responseJson mj_JSONObject];
        
        NSLog(@"[GetRequest:%@,%@] %@", URLString, parameters, responseDict);
        if (([responseDict[@"status"] integerValue] == 0 || [responseDict[@"status"] integerValue] == 4004) && handleSuccess) {
            handleSuccess(self, responseDict);
        }
        else {
            [self handleRequestStatus:responseDict];
            if (handleFailure) {
                handleFailure(self, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[GetRequest:%@,%@] %@", URLString, parameters, error.localizedDescription);
        if (handleFailure) {
            handleFailure(self, error);
        }
    }];
    
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(BYRequest *request, NSDictionary* responseString))handleSuccess
     failure:(void (^)(BYRequest *request, NSError *error))handleFailure
{
    self.operationQueue = self.operationManager.operationQueue;
    //    self.operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.operationManager.requestSerializer.timeoutInterval = self.kRequestOut;
    //    [self.operationManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [self.operationManager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    NSString *token = [YBDefultInfoTool sharedInstance].ybToken;
//    [self.operationManager.requestSerializer setValue:PBAvailableString(token) forHTTPHeaderField:@"yb_doctor_token"];
//    [self.operationManager.requestSerializer setValue:@"3" forHTTPHeaderField:@"yb_doctor_client"];
//    [self.operationManager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"yb_doctor_version"];
    
    //双向认证 安全设置
    AFSecurityPolicy *sec_policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    sec_policy.allowInvalidCertificates = true;//
    sec_policy.validatesDomainName = false;//验证域名
    
    self.operationManager.securityPolicy = sec_policy;
    
//    NSDictionary* param = [[BYRequestHelper sharedInstance] parametersWithDictionary:parameters];
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //
        //NSLog(@"%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSDictionary *responseDict = [responseJson mj_JSONObject];
        
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, responseDict);
        
        if (([responseDict[@"status"] integerValue] == 0 || [responseDict[@"status"] integerValue] == 4004) && handleSuccess) {
            handleSuccess(self, responseDict);
        }
        else {
            [self handleRequestStatus:responseDict];
            if (handleFailure) {
                handleFailure(self, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, error.localizedDescription);
        if (handleFailure) {
            handleFailure(self, error);
        }
    }];
    
}

- (void)POSTWithIdParams:(NSString *)URLString
              parameters:(NSDictionary*)parameters
                 success:(void (^)(BYRequest *request, NSDictionary* responseString))handleSuccess
                 failure:(void (^)(BYRequest *request, NSError *error))handleFailure
{
    self.operationQueue = self.operationManager.operationQueue;
    //    self.operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.operationManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.operationManager.requestSerializer.timeoutInterval = self.kRequestOut;
    //    [self.operationManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [self.operationManager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    NSString *token = [YBDefultInfoTool sharedInstance].ybToken;
//    [self.operationManager.requestSerializer setValue:PBAvailableString(token) forHTTPHeaderField:@"yb_doctor_token"];
//    [self.operationManager.requestSerializer setValue:@"3" forHTTPHeaderField:@"yb_doctor_client"];
//    [self.operationManager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"yb_doctor_version"];
    
    //双向认证 安全设置
    AFSecurityPolicy *sec_policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    sec_policy.allowInvalidCertificates = true;//
    sec_policy.validatesDomainName = false;//验证域名
    
    self.operationManager.securityPolicy = sec_policy;
    
//    NSDictionary* param = [[BYRequestHelper sharedInstance] parametersWithDictionary:parameters];
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //
        //NSLog(@"%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSDictionary *responseDict = [responseJson mj_JSONObject];
        
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, responseDict);
        
        if (([responseDict[@"status"] integerValue] == 0 || [responseDict[@"status"] integerValue] == 4004) && handleSuccess) {
            handleSuccess(self, responseDict);
        }
        else {
            [self handleRequestStatus:responseDict];
            if (handleFailure) {
                handleFailure(self, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, error.localizedDescription);
        if (handleFailure) {
            handleFailure(self, error);
        }
    }];
    
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
  uploadData:(NSData *)data
    fileName:(NSString *)fileName
     success:(void (^)(BYRequest *request, NSDictionary* responseString))handleSuccess
     failure:(void (^)(BYRequest *request, NSError *error))handleFailure
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.operationManager.requestSerializer.timeoutInterval = self.kRequestOut;
//    NSString *token = [YBDefultInfoTool sharedInstance].ybToken;
//    [self.operationManager.requestSerializer setValue:PBAvailableString(token) forHTTPHeaderField:@"yb_doctor_token"];
//    [self.operationManager.requestSerializer setValue:@"3" forHTTPHeaderField:@"yb_doctor_client"];
//    [self.operationManager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forHTTPHeaderField:@"yb_doctor_version"];
    
    //双向认证 安全设置
    AFSecurityPolicy *sec_policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    sec_policy.allowInvalidCertificates = true;//
    sec_policy.validatesDomainName = false;//验证域名
    
    self.operationManager.securityPolicy = sec_policy;
    
//    NSDictionary* param = [[BYRequestHelper sharedInstance] parametersWithDictionary:parameters];
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self.operationManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"application/octet-stream"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //
        //NSLog(@"%@", uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSDictionary *responseDict = [responseJson mj_JSONObject];
        
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, responseDict);
        if (([responseDict[@"status"] integerValue] == 0 || [responseDict[@"status"] integerValue] == 4004) && handleSuccess) {
            handleSuccess(self, responseDict);
        }
        else {
            [self handleRequestStatus:responseDict];
            if (handleFailure) {
                handleFailure(self, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"[PostRequest:%@,%@] %@", URLString, parameters, error.localizedDescription);
        if (handleFailure) {
            handleFailure(self, error);
        }
    }];
    
}

- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters {
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self POST:URLString
    parameters:parameters
       success:^(BYRequest *request, NSDictionary *responseDict) {
           if ([self.delegate respondsToSelector:@selector(BYRequest:finished:)]) {
               [self.delegate BYRequest:request finished:responseDict];
               
           }
       }
       failure:^(BYRequest *request, NSError *error) {
           if ([self.delegate respondsToSelector:@selector(BYRequest:Error:)]) {
               [self.delegate BYRequest:request Error:error.description];
           }
       }];
}

- (void)getWithURL:(NSString *)URLString {
//    URLString = [[BYURLHeader sharedURLHeader].urlPublic stringByAppendingString:URLString];
    [self GET:URLString parameters:nil success:^(BYRequest *request, NSDictionary *responseDict) {
        if ([self.delegate respondsToSelector:@selector(BYRequest:finished:)]) {
            [self.delegate BYRequest:request finished:responseDict];
        }
    } failure:^(BYRequest *request, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(BYRequest:Error:)]) {
            [self.delegate BYRequest:request Error:error.description];
        }
    }];
}

- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}

- (void)handleRequestStatus:(NSDictionary *)responseDict
{
    // SERVER_SUCCESS = 0;             请求成功
    // TOKEN_EXPIRED = 99;             token过期
    // VERIFY_CODE_ERROR = 109;        验证码错误
    // PHONE_CODE_ERROR =110;          手机号码格式错误
    // AUTHENTICATION_ERROR = 1000;    数据加解密失败
    // PARAMETER_ERROR = 4010;         参数错误
    // NO_PERMISSION = 4001;           无操作权限
    // SERVER_ERROR = 5001;            请求失败
    // USER_NOT_REGISTERED = 2001;     用户未注销
    // USER_NOT_ACTIVED = 2002;        用户未激活
    // USER_PASSWORD_ERROR = 2004;     用户账号密码错误
    // OPT_LIMITED =1005;              操作次数限制
//    DismissHud();
//    switch ([responseDict[@"status"] integerValue])
//    {
//        case 99:
//            if ([NSStringFromClass(self.class) rangeOfString:@"login"].location == NSNotFound) {
//                
//                // 发起请求的不是登录页面，切换到登录页面
//                [[YBDefultInfoTool sharedInstance] ybLogout];
//                
//                UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"提示" message:@"账户有异常，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
//                [PBAlertHelper addActionTarget:alertCtrl title:@"确定" color:c_grapefruit action:^(UIAlertAction *action) {
//                    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//                    [appDelegate switchRootController:NO dentifitedFlag:OverIdStatus];
//                }];
//                
//                PBMAINDelay(PBANIMATE_DURATION, ^{
//                    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//                    [appDelegate.window.rootViewController presentViewController:alertCtrl animated:true completion:nil];
//                });
//            }
//            break;
//        case 109:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"请输入正确的验证码"];
//            break;
//        case 110:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"请输入正确的手机号"];
//            break;
//        case 1005:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"您请求的验证码次数过多，请稍后再试"];
//            break;
//        case 2001:
//        case 2003:
//            [PBAlertHelper alertInfo:@"提示" withMessage:[NSString stringWithFormat:@"此账号尚未开通，具体请联系%@",[YBDefultInfoTool sharedInstance].contactPhone]];
//            break;
//        case 2002:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"该手机号未激活"];
//            break;
//        case 2004:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"验证码错误，请重新输入"];
//            break;
//        case 4010:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"服务器开小差啦，请稍后再试"];
//            break;
//        case 5001:
//        case 1000:
//            [PBAlertHelper alertInfo:@"提示" withMessage:@"服务器开小差啦，请稍后再试"];
//            break;
//        case 4000:
//        case 4001:
//        default:
//            PBMAINDelay(PBANIMATE_DURATION, ^{
//                [PBAlertHelper alertInfo:@"提示" withMessage:responseDict[@"info"]];
//            });
//            break;
//    }
}

@end
