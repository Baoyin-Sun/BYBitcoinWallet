//
//  MineLogOutCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/28.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineLogOutCell.h"

@interface MineLogOutCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MineLogOutCell

- (void)by_setupViews {
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(18);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _titleLabel.text = @"退出当前账户";
    }
    return _titleLabel;
}

@end
