//
//  HomePageMarketTabView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageMarketTabView.h"

@interface HomePageMarketTabView ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *upsLabel;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation HomePageMarketTabView

- (void)by_setupViews {
    [self addSubview:self.nameLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.upsLabel];
    [self addSubview:self.lineView];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(by_autoResize(5));
        make.left.mas_equalTo(by_autoResize(15));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(by_autoResize(10));
        make.right.mas_equalTo(by_autoResize(-15));
    }];
    
    [self.upsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(by_autoResize(10));
        make.bottom.mas_equalTo(by_autoResize(-5));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(by_autoResize(5));
        make.bottom.mas_equalTo(by_autoResize(-5));
        make.width.mas_equalTo(0.5);
    }];
}

- (void)by_bindViewModel {
    
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = BYSystemFont(14);
        _nameLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _nameLabel.text = @"POE/ETH";
    }
    return _nameLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = BYSystemFont(15);
        _priceLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _priceLabel.text = @"E0.00010983";
    }
    return _priceLabel;
}

- (UILabel *)upsLabel {
    if (!_upsLabel) {
        _upsLabel = [[UILabel alloc] init];
        _upsLabel.font = BYSystemFont(13);
        _upsLabel.textColor = [UIColor by_colorWithHexString:c_greenishTeal];
        _upsLabel.text = @"+35.59%";
    }
    return _upsLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo_line];
    }
    return _lineView;
}

@end
