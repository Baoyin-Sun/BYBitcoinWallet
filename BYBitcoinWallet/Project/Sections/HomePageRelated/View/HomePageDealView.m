//
//  HomePageDealView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageDealView.h"

@interface HomePageDealView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation HomePageDealView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.infoLabel];
    [self addSubview:self.lineView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(19));
        make.top.mas_equalTo(by_autoResize(10));
        make.bottom.mas_equalTo(by_autoResize(-10));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(by_autoResize(20));
        make.centerY.mas_equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(0.5, by_autoResize(15)));
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineView.mas_right).offset(by_autoResize(20));
        make.centerY.mas_equalTo(self.titleLabel);
    }];
}

- (void)by_bindViewModel {
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(18);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _titleLabel.text = @"法币交易";
    }
    return _titleLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.font = BYSystemFont(16);
        _infoLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _infoLabel.text = @"各国货币交易 BTC";
    }
    return _infoLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo_line];
    }
    return _lineView;
}

@end
