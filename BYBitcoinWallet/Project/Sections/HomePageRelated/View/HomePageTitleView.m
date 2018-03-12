//
//  HomePageTitleView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageTitleView.h"

@interface HomePageTitleView ()

@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HomePageTitleView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.logoView];
    [self addSubview:self.titleLabel];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(30));
        make.top.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(30), by_autoResize(30)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.logoView);
        make.left.mas_equalTo(self.logoView.mas_right).offset(by_autoResize(5));
    }];
}

- (void)by_bindViewModel {
    
}

- (UIImageView *)logoView {
    if (!_logoView) {
        _logoView = [[UIImageView alloc] init];
        _logoView.backgroundColor = [UIColor lightGrayColor];
    }
    return _logoView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYBoldFont(by_autoResize(20));
        _titleLabel.text = @"OKEX";
    }
    return _titleLabel;
}

@end
