//
//  ContractDealNewsCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/2.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "ContractDealNewsCell.h"

@interface ContractDealNewsCell ()

@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation ContractDealNewsCell

- (void)by_setupViews {
    [self.contentView addSubview:self.countLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.numberLabel];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(5));
        make.centerY.mas_equalTo(0);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(40));
        make.centerY.mas_equalTo(self.countLabel);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-5));
        make.centerY.mas_equalTo(self.priceLabel);
    }];
}

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = [UILabel labelWithFont:BYSystemFont(13)
                                   textColor:BYCustomColor(c_black)];
        _countLabel.text = @"";
    }
    return _countLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel labelWithFont:BYSystemFont(13)
                                   textColor:BYCustomColor(c_greenishTeal)];
        _priceLabel.text = @"12345.34";
    }
    return _priceLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel labelWithFont:BYSystemFont(13)
                                    textColor:BYCustomColor(c_black)];
        _numberLabel.text = @"0.788";
    }
    return _numberLabel;
}

- (void)setIsTop:(BOOL)isTop {
    _isTop = isTop;
   self.priceLabel.textColor = self.isTop ? BYCustomColor(c_grapefruit) : BYCustomColor(c_greenishTeal);
}

- (void)setCountStr:(NSString *)countStr {
    _countStr = countStr;
    self.countLabel.text = self.countStr;
}


@end
