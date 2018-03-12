//
//  CoinDealNewsCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/2.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "CoinDealNewsCell.h"

@interface CoinDealNewsCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation CoinDealNewsCell

- (void)by_setupViews {
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightLabel];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(5));
        make.centerY.mas_equalTo(0);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-5));
        make.centerY.mas_equalTo(0);
    }];
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel labelWithFont:BYSystemFont(12)
                                  textColor:BYCustomColor(c_greenishTeal)];
        _leftLabel.text = @"0.23574895";
    }
    return _leftLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [UILabel labelWithFont:BYSystemFont(12)
                                  textColor:BYCustomColor(c_black)];
        _rightLabel.text = @"0.389";
    }
    return _rightLabel;
}

- (void)setIsTop:(BOOL)isTop {
    _isTop = isTop;
    self.leftLabel.textColor = self.isTop ? BYCustomColor(c_grapefruit) : BYCustomColor(c_greenishTeal);
}

@end
