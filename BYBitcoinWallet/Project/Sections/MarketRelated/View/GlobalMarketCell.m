//
//  GlobalMarketCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/24.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "GlobalMarketCell.h"

@interface GlobalMarketCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *usdLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *usdPriceLabel;
@property (nonatomic, strong) UILabel *cnyPriceLabel;
@property (nonatomic, strong) UILabel *upsLabel;

@end

@implementation GlobalMarketCell

- (void)by_setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.usdLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.usdPriceLabel];
    [self.contentView addSubview:self.cnyPriceLabel];
    [self.contentView addSubview:self.upsLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.usdPriceLabel);
        make.left.mas_equalTo(by_autoResize(15));
    }];
    
    [self.usdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(by_autoResize(5));
        make.centerY.mas_equalTo(self.titleLabel);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.upsLabel);
        make.left.mas_equalTo(self.titleLabel);
    }];
    
    [self.usdPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-15));
        make.top.mas_equalTo(by_autoResize(15));
    }];
    
    [self.cnyPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.upsLabel);
        make.right.mas_equalTo(self.upsLabel.mas_left).offset(by_autoResize(-5));
    }];
    
    [self.upsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.usdPriceLabel.mas_right);
        make.top.mas_equalTo(self.usdPriceLabel.mas_bottom).offset(by_autoResize(10));
        make.height.mas_equalTo(by_autoResize(20));
        make.bottom.mas_equalTo(by_autoResize(-15));
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(16);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _titleLabel.text = @"BTC 当周·0126";
    }
    return _titleLabel;
}

- (UILabel *)usdLabel {
    if (!_usdLabel) {
        _usdLabel = [[UILabel alloc] init];
        _usdLabel.font = BYSystemFont(14);
        _usdLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _usdLabel.text = @"USD";
    }
    return _usdLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = BYSystemFont(13);
        _numberLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _numberLabel.text = @"成交量 21,103";
    }
    return _numberLabel;
}

- (UILabel *)usdPriceLabel {
    if (!_usdPriceLabel) {
        _usdPriceLabel = [[UILabel alloc] init];
        _usdPriceLabel.font = BYSystemFont(16);
        _usdPriceLabel.textColor = [UIColor by_colorWithHexString:c_greenishTeal];
        _usdPriceLabel.text = @"$12903.32";
    }
    return _usdPriceLabel;
}

- (UILabel *)cnyPriceLabel {
    if (!_cnyPriceLabel) {
        _cnyPriceLabel = [[UILabel alloc] init];
        _cnyPriceLabel.font = BYSystemFont(13);
        _cnyPriceLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _cnyPriceLabel.text = @"￥2903845.32";
    }
    return _cnyPriceLabel;
}

- (UILabel *)upsLabel {
    if (!_upsLabel) {
        _upsLabel = [[UILabel alloc] init];
        _upsLabel.backgroundColor = [UIColor by_colorWithHexString:c_grapefruit];
        _upsLabel.layer.cornerRadius = by_autoResize(2);
        _upsLabel.layer.masksToBounds = YES;
        _upsLabel.font = BYSystemFont(16);
        _upsLabel.textColor = [UIColor whiteColor];
        _upsLabel.text = @" -21.34% ";
    }
    return _upsLabel;
}


@end
