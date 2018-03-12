//
//  HomePageUpsNoticeView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/22.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageUpsNoticeView.h"

@interface HomePageUpsNoticeView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation HomePageUpsNoticeView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.top.mas_equalTo(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(20), by_autoResize(20)));
        make.bottom.mas_equalTo(by_autoResize(-10));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageView);
        make.left.mas_equalTo(self.imageView.mas_right).offset(by_autoResize(10));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.right.mas_equalTo(by_autoResize(-15));
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)by_bindViewModel {
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(18);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _titleLabel.text = @"涨跌榜";
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo_line];
    }
    return _lineView;
}

@end
