//
//  HomePageAnnouncementCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageAnnouncementCell.h"

@interface HomePageAnnouncementCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *iconLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HomePageAnnouncementCell

- (void)by_setupViews {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.iconLabel];
    [self.bgView addSubview:self.titleLabel];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(12));
        make.top.mas_equalTo(by_autoResize(5));
        make.right.mas_equalTo(by_autoResize(-12));
        make.height.mas_equalTo(by_autoResize(34));
    }];
    
    [self.iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titleLabel.mas_left).offset(by_autoResize(-12));
        make.centerY.mas_equalTo(self.bgView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bgView.mas_centerX).offset(by_autoResize(13));
        make.centerY.mas_equalTo(self.bgView);
    }];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor by_colorWithHexString:c_whiteSix];
        _bgView.layer.cornerRadius = by_autoResize(17);
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)iconLabel {
    if (!_iconLabel) {
        _iconLabel = [[UILabel alloc] init];
        _iconLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _iconLabel.font = [UIFont fontWithName:@"iconfont" size:by_autoResize(15)];
        _iconLabel.text = @"\U0000e716";
        _iconLabel.textAlignment = NSTextAlignmentRight;
        [_iconLabel sizeToFit];
    }
    return _iconLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(14);
        [_titleLabel sizeToFit];
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _titleLabel.text = @"OKEx关于临时暂停XPP充值和提现的公告";
    }
    return _titleLabel;
}

@end
