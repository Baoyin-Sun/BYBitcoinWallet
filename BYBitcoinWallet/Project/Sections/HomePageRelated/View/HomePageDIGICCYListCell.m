//
//  HomePageDIGICCYListCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageDIGICCYListCell.h"

@interface HomePageDIGICCYListCell ()

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *upsLabel;

@end

@implementation HomePageDIGICCYListCell

- (void)by_setupViews {
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.upsLabel];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.centerY.mas_equalTo(self.upsLabel);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.upsLabel);
        make.left.mas_equalTo(self.numberLabel.mas_right).offset(by_autoResize(5));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.upsLabel.mas_left).offset(by_autoResize(-10));
        make.centerY.mas_equalTo(self.upsLabel);
    }];
    
    [self.upsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-15));
        make.top.mas_equalTo(by_autoResize(10));
        make.bottom.mas_equalTo(by_autoResize(-10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(80), by_autoResize(20)));
    }];
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = BYSystemFont(14);
        _numberLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _numberLabel.text = @"1";
    }
    return _numberLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = BYSystemFont(14);
        _nameLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _nameLabel.text = @"DPY/ETH";
    }
    return _nameLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = BYSystemFont(14);
        _priceLabel.textColor = [UIColor by_colorWithHexString:c_greenishTeal];
        _priceLabel.text = @"E0.00010983";
    }
    return _priceLabel;
}

- (UILabel *)upsLabel {
    if (!_upsLabel) {
        _upsLabel = [[UILabel alloc] init];
        _upsLabel.backgroundColor = [UIColor by_colorWithHexString:c_greenishTeal];
        _upsLabel.layer.cornerRadius = by_autoResize(2);
        _upsLabel.layer.masksToBounds = YES;
        _upsLabel.font = BYSystemFont(14);
        _upsLabel.textColor = [UIColor whiteColor];
        _upsLabel.textAlignment = NSTextAlignmentCenter;
        _upsLabel.text = @"+35.59%";
    }
    return _upsLabel;
}


@end
