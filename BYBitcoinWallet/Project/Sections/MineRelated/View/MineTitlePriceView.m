//
//  MineTitlePriceView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/25.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineTitlePriceView.h"

@interface MineTitlePriceView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation MineTitlePriceView

- (void)by_setupViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.unitLabel];
    [self addSubview:self.priceLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.top.mas_equalTo(0);
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.bottom.mas_equalTo(self.priceLabel.mas_bottom);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.unitLabel.mas_right);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(by_autoResize(10));
        make.bottom.mas_equalTo(0);
    }];
}

- (void)by_bindViewModel {
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(13);
        _titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    }
    return _titleLabel;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.font = BYSystemFont(12);
        _unitLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _unitLabel.text = @"B";
    }
    return _unitLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = BYSystemFont(17);
        _priceLabel.textColor = [UIColor whiteColor];
    }
    return _priceLabel;
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = self.titleStr;
}

- (void)setPriceStr:(NSString *)priceStr {
    _priceStr = priceStr;
    self.priceLabel.text = self.priceStr;
}

@end
