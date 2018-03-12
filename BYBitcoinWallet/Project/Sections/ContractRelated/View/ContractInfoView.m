//
//  ContractInfoView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/1.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "ContractInfoView.h"

@interface ContractInfoView ()

@property (nonatomic, strong) UILabel *coinLabel;
@property (nonatomic, strong) UILabel *arrowLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ContractInfoView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.coinLabel];
    [self addSubview:self.arrowLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.imageView];
    [self addSubview:self.lineView];
    
    [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.centerY.mas_equalTo(0);
    }];
    
    [self.arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.coinLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.coinLabel);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.arrowLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.coinLabel);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(by_autoResize(15));
        make.bottom.right.mas_equalTo(by_autoResize(-15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(20), by_autoResize(20)));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.right.mas_equalTo(by_autoResize(-15));
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)coinLabel {
    if (!_coinLabel) {
        _coinLabel = [[UILabel alloc] init];
        _coinLabel.font = BYSystemFont(16);
        _coinLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _coinLabel.text = @"EOS 季度·0330";
    }
    return _coinLabel;
}

- (UILabel *)arrowLabel {
    if (!_arrowLabel) {
        _arrowLabel = [[UILabel alloc] init];
        _arrowLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _arrowLabel.font = BYCustomFont(14);
        _arrowLabel.text = @"\U0000e686";
        _arrowLabel.textAlignment = NSTextAlignmentRight;
    }
    return _arrowLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = BYSystemFont(15);
        _priceLabel.textColor = [UIColor by_colorWithHexString:c_greenishTeal];
        _priceLabel.text = @"$12.376";
    }
    return _priceLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imageView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo_line];
    }
    return _lineView;
}

@end
