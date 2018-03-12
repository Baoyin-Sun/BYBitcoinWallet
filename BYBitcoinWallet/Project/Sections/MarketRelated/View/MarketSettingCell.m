//
//  MarketSettingCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/24.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MarketSettingCell.h"
#import "LimitLengthTextField.h"

@interface MarketSettingCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) LimitLengthTextField *upsTextField;
@property (nonatomic, strong) LimitLengthTextField *downsTextField;
@property (nonatomic, strong) UISwitch *setSwitch;

@end

@implementation MarketSettingCell

- (void)by_setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.unitLabel];
    [self.contentView addSubview:self.upsTextField];
    [self.contentView addSubview:self.downsTextField];
    [self.contentView addSubview:self.setSwitch];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.centerY.mas_equalTo(self.upsTextField);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.centerY.mas_equalTo(self.downsTextField);
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right).offset(by_autoResize(5));
        make.centerY.mas_equalTo(self.priceLabel);
    }];
    
    [self.upsTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.setSwitch.mas_left).offset(by_autoResize(-15));
        make.top.mas_equalTo(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(100), by_autoResize(22)));
    }];
    
    [self.downsTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.upsTextField.mas_right);
        make.top.mas_equalTo(self.upsTextField.mas_bottom).offset(by_autoResize(5));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(100), by_autoResize(22)));
        make.bottom.mas_equalTo(by_autoResize(-10));
    }];
    
    [self.setSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-15));
        make.centerY.mas_equalTo(0);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(14);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_darkSkyBlue];
        _titleLabel.text = @"BCH/BTC";
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = BYSystemFont(15);
        _priceLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _priceLabel.text = @"0.14630229";
    }
    return _priceLabel;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.font = BYSystemFont(13);
        _unitLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _unitLabel.text = @"BTC";
    }
    return _unitLabel;
}

- (LimitLengthTextField *)upsTextField {
    if (!_upsTextField) {
        _upsTextField = [[LimitLengthTextField alloc] init];
        _upsTextField.backgroundColor = [UIColor by_colorWithHexString:c_whiteSix];
        _upsTextField.layer.cornerRadius = by_autoResize(2);
        _upsTextField.layer.masksToBounds = YES;
        _upsTextField.font = BYSystemFont(13);
        _upsTextField.placeholder = @"输入价格上限";
        _upsTextField.textAlignment = NSTextAlignmentCenter;
    }
    return _upsTextField;
}

- (LimitLengthTextField *)downsTextField {
    if (!_downsTextField) {
        _downsTextField = [[LimitLengthTextField alloc] init];
        _downsTextField.backgroundColor = [UIColor by_colorWithHexString:c_whiteSix];
        _downsTextField.layer.cornerRadius = by_autoResize(2);
        _downsTextField.layer.masksToBounds = YES;
        _downsTextField.font = BYSystemFont(13);
        _downsTextField.placeholder = @"输入价格下限";
        _downsTextField.textAlignment = NSTextAlignmentCenter;
    }
    return _downsTextField;
}

- (UISwitch *)setSwitch {
    if (!_setSwitch) {
        _setSwitch = [[UISwitch alloc] init];
    }
    return _setSwitch;
}


@end
