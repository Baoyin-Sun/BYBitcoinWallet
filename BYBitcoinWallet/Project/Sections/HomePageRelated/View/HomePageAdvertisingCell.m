//
//  HomePageAdvertisingCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/22.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageAdvertisingCell.h"

@interface HomePageAdvertisingCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HomePageAdvertisingCell

- (void)by_setupViews {
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYBoldFont(by_autoResize(14));
        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _titleLabel.text = @"已获得1000万美金的A轮融资";
    }
    return _titleLabel;
}

- (void)setLogoArr:(NSArray *)logoArr {
    _logoArr = logoArr;
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(by_autoResize(20));
    }];
    
    UIImageView *lastImage = nil;
    for (int i = 0; i < 6; i++) {
        UIImageView *image = [[UIImageView alloc] init];
        image.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastImage) {
                if (i % 3 == 0) {
                    make.left.mas_equalTo(by_autoResize(67.5));
                    make.top.mas_equalTo(lastImage.mas_bottom).offset(by_autoResize(30));
                } else {
                    make.left.mas_equalTo(lastImage.mas_right).offset(by_autoResize(67.5));
                    make.top.mas_equalTo(lastImage.mas_top);
                }
            } else {
                make.left.mas_equalTo(by_autoResize(67.5));
                make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(by_autoResize(20));
            }
            make.size.mas_equalTo(CGSizeMake(by_autoResize(35), by_autoResize(35)));
        }];
        lastImage = image;
    }
    
    [lastImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(by_autoResize(-20));
    }];
}

@end
