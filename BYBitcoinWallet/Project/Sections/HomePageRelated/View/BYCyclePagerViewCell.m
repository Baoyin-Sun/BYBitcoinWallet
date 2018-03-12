//
//  BYCyclePagerViewCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYCyclePagerViewCell.h"

@interface BYCyclePagerViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BYCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setSubViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}

- (void)setSubViews {
    [self addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor lightGrayColor];
        _imageView.layer.cornerRadius = by_autoResize(4);
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

@end
