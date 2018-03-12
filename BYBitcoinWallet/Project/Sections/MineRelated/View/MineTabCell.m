//
//  MineTabCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/28.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineTabCell.h"
#import "MineTabView.h"

@interface MineTabCell ()

@property (nonatomic, strong) MineTabView *leftView;
@property (nonatomic, strong) MineTabView *mideView;
@property (nonatomic, strong) MineTabView *rightView;

@end

@implementation MineTabCell

- (void)by_setupViews {
    [self.contentView addSubview:self.leftView];
    [self.contentView addSubview:self.mideView];
    [self.contentView addSubview:self.rightView];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(BYScreen_width / 3);
    }];
    
    [self.mideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftView);
        make.left.mas_equalTo(self.leftView.mas_right);
        make.width.mas_equalTo(self.leftView);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftView);
        make.left.mas_equalTo(self.mideView.mas_right);
        make.width.mas_equalTo(self.leftView);
    }];
}

- (MineTabView *)leftView {
    if (!_leftView) {
        _leftView = [[MineTabView alloc] init];
    }
    return _leftView;
}

- (MineTabView *)mideView {
    if (!_mideView) {
        _mideView = [[MineTabView alloc] init];
    }
    return _mideView;
}

- (MineTabView *)rightView {
    if (!_rightView) {
        _rightView = [[MineTabView alloc] init];
    }
    return _rightView;
}

- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    
    NSDictionary *dic1 = titleArr.firstObject;
    self.leftView.titleStr = dic1[@"title"];
    self.leftView.image = [UIImage imageNamed:dic1[@"image"]];
    
    NSDictionary *dic2 = titleArr[1];
    self.mideView.titleStr = dic2[@"title"];
    self.mideView.image = [UIImage imageNamed:dic2[@"image"]];
    
    NSDictionary *dic3 = titleArr.lastObject;
    self.rightView.titleStr = dic3[@"title"];
    self.rightView.image = [UIImage imageNamed:dic3[@"image"]];
}

@end
