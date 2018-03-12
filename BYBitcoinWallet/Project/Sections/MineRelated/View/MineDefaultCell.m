//
//  MineDefaultCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/28.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineDefaultCell.h"

@interface MineDefaultCell ()

@property (nonatomic, strong) UILabel *iconLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *arrowLabel;

@end

@implementation MineDefaultCell

- (void)by_setupViews {
    [self.contentView addSubview:self.iconLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.arrowLabel];
    
    [self.iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconLabel.mas_right).offset(by_autoResize(13));
        make.centerY.mas_equalTo(self.iconLabel);
    }];
    
    [self.arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-15));
        make.centerY.mas_equalTo(self.titleLabel);
    }];
}

- (UILabel *)iconLabel {
    if (!_iconLabel) {
        _iconLabel = [[UILabel alloc] init];
        _iconLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _iconLabel.font = BYCustomFont(20);
        _iconLabel.textAlignment = NSTextAlignmentCenter;
        [_iconLabel sizeToFit];
    }
    return _iconLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel sizeToFit];
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _titleLabel.font = BYSystemFont(16);
        _titleLabel.text = @"我的合作医生";
    }
    return _titleLabel;
};

- (UILabel *)arrowLabel {
    if (!_arrowLabel) {
        _arrowLabel = [[UILabel alloc] init];
        _arrowLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _arrowLabel.font = BYCustomFont(18);
        _arrowLabel.text = @"\U0000e687";
        _arrowLabel.textAlignment = NSTextAlignmentRight;
    }
    return _arrowLabel;
}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    self.iconLabel.text = dic[@"imageName"];
    self.titleLabel.text = dic[@"titleName"];
}

@end
