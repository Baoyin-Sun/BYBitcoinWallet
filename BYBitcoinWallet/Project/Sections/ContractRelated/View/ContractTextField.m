//
//  ContractTextField.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/1.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "ContractTextField.h"
#import "LimitLengthTextField.h"

@interface ContractTextField ()

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) LimitLengthTextField *textField;
@property (nonatomic, strong) UILabel *unitLabel;

@end

@implementation ContractTextField

- (void)by_setupViews {
    self.layer.cornerRadius = by_autoResize(2);
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    @weakify(self);
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        @strongify(self);
        self.isSelect = !self.isSelect;
    }];
    [self addGestureRecognizer:tap];
    
    [self addSubview:self.priceLabel];
    [self addSubview:self.textField];
    [self addSubview:self.unitLabel];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(5));
        make.centerY.mas_equalTo(0);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceLabel.mas_right);
        make.right.mas_equalTo(self.unitLabel.mas_left);
        make.top.bottom.mas_equalTo(0);
        make.height.mas_equalTo(by_autoResize(20));
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-5));
        make.centerY.mas_equalTo(0);
    }];
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel labelWithFont:BYSystemFont(14)
                                   textColor:BYCustomColor(c_brownishGrey)];
    }
    return _priceLabel;
}

- (LimitLengthTextField *)textField {
    if (!_textField) {
        _textField = [[LimitLengthTextField alloc] init];
    }
    return _textField;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [UILabel labelWithFont:BYSystemFont(14)
                                  textColor:BYCustomColor(c_brownishGrey)];
    }
    return _unitLabel;
}

- (void)setPriceStr:(NSString *)priceStr {
    _priceStr = priceStr;
    self.priceLabel.text = self.priceStr;
}

- (void)setUnitStr:(NSString *)unitStr {
    _unitStr = unitStr;
    self.unitLabel.text = unitStr;
}

- (void)setIsSelect:(BOOL)isSelect {
    _isSelect = isSelect;
    self.layer.borderColor = self.isSelect ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
}

@end
