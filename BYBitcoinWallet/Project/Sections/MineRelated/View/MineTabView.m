//
//  MineTabView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/28.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineTabView.h"

@interface MineTabView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MineTabView

- (void)by_setupViews {
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(by_autoResize(20));
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(30), by_autoResize(30)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(by_autoResize(10));
        make.centerX.mas_equalTo(self.imageView);
        make.bottom.mas_equalTo(by_autoResize(-20));
    }];
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
        _titleLabel.font = BYSystemFont(14);
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
    }
    return _titleLabel;
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = self.titleStr;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

@end
