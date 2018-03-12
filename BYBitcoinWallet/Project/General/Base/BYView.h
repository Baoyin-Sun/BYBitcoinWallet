//
//  BYView.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/8/31.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYViewModelProtocol;

@protocol BYViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <BYViewModelProtocol>)viewModel;

- (void)by_bindViewModel;
- (void)by_setupViews;
- (void)by_addReturnKeyBoard;

@end

@interface BYView : UIView <BYViewProtocol>

@property (nonatomic, strong) id<BYViewModelProtocol> byViewModel;

@end
