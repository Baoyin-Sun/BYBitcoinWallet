//
//  HomePageDealCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/22.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageDealCell.h"
#import "TradingRangeView.h"

@interface HomePageDealCell ()

@property (nonatomic, strong) TradingRangeView *leftView;
@property (nonatomic, strong) TradingRangeView *rightView;

@end

@implementation HomePageDealCell

- (void)by_setupViews {
    [self.contentView addSubview:self.leftView];
    [self.contentView addSubview:self.rightView];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.top.mas_equalTo(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(165), by_autoResize(60)));
        make.bottom.mas_equalTo(by_autoResize(-10));
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftView);
        make.left.mas_equalTo(self.leftView.mas_right).offset(by_autoResize(15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(165), by_autoResize(60)));
    }];
}

- (TradingRangeView *)leftView {
    if (!_leftView) {
        _leftView = [[TradingRangeView alloc] init];
        _leftView.layer.cornerRadius = by_autoResize(2);
        _leftView.layer.masksToBounds = YES;
        _leftView.titleStr = @"指数交易区";
        _leftView.infoStr = @"急速成交";
    }
    return _leftView;
}

- (TradingRangeView *)rightView {
    if (!_rightView) {
        _rightView = [[TradingRangeView alloc] init];
        _rightView.layer.cornerRadius = by_autoResize(2);
        _rightView.layer.masksToBounds = YES;
        _rightView.titleStr = @"点对点交易区";
        _rightView.infoStr = @"冲提自由";
    }
    return _rightView;
}



@end
