//
//  TradingRangeView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/22.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "TradingRangeView.h"

@interface TradingRangeView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation TradingRangeView

- (void)by_setupViews {
    self.backgroundColor = [UIColor by_colorWithHexString:c_lightWhite];
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.infoLabel];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(by_autoResize(15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(20), by_autoResize(20)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(by_autoResize(10));
        make.top.mas_equalTo(by_autoResize(10));
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(by_autoResize(10));
    }];
}

- (void)by_bindViewModel {
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = by_autoResize(10);
        _imageView.layer.masksToBounds = YES;
        _imageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(15);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
    }
    return _titleLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.font = BYSystemFont(14);
        _infoLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
    }
    return _infoLabel;
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = self.titleStr;
}

- (void)setInfoStr:(NSString *)infoStr {
    _infoStr = infoStr;
    self.infoLabel.text = infoStr;
}

@end
