//
//  MineTitleView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/25.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineTitleView.h"
#import "MineTitlePriceView.h"

@interface MineTitleView ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *okexLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *addAccountBtn;
@property (nonatomic, strong) MineTitlePriceView *leftView;
@property (nonatomic, strong) MineTitlePriceView *rightView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation MineTitleView

-(void)by_setupViews {
    self.backgroundColor = [UIColor by_colorWithHexString:c_darkSkyBlue];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
//    @weakify(self);
//    [[tap rac_gestureSignal] subscribeNext:^(id x) {
//        @strongify(self);
////        BYPersonInfoCtr *vc = [[BYPersonInfoCtr alloc] init];
////        vc.hidesBottomBarWhenPushed = YES;
////        [self.rootVC.navigationController pushViewController:vc animated:YES];
//    }];
//    [self addGestureRecognizer:tap];
//    self.userInteractionEnabled = YES;
    
    [self addSubview:self.headImage];
    [self addSubview:self.okexLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.addAccountBtn];
    [self addSubview:self.leftView];
    [self addSubview:self.lineView];
    [self addSubview:self.rightView];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(by_autoResize(15));
        make.top.mas_equalTo(by_autoResize(70));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(40), by_autoResize(40)));
    }];
    
    [self.okexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImage.mas_right).offset(by_autoResize(10));
        make.top.mas_equalTo(self.headImage.mas_top);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.okexLabel.mas_left);
        make.bottom.mas_equalTo(self.headImage.mas_bottom);
    }];
    
    [self.addAccountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(by_autoResize(-15));
        make.centerY.mas_equalTo(self.headImage);
    }];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(by_autoResize(-10));
        make.width.mas_equalTo(BYScreen_width / 2);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(self.leftView);
        make.size.mas_equalTo(CGSizeMake(0.5, by_autoResize(30)));
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.leftView);
        make.width.mas_equalTo(BYScreen_width / 2);
    }];
}

- (void)by_bindViewModel {
   
}


#pragma mark -
#pragma mark - lazy loading
- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.backgroundColor = [UIColor lightGrayColor];
        _headImage.layer.cornerRadius = by_autoResize(20);
        _headImage.layer.masksToBounds = YES;
    }
    return _headImage;
}

- (UILabel *)okexLabel {
    if (!_okexLabel) {
        _okexLabel = [[UILabel alloc] init];
        _okexLabel.font = BYSystemFont(14);
        _okexLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _okexLabel.text = @"OKEX";
    }
    return _okexLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = BYSystemFont(17);
        _nameLabel.textColor =[UIColor whiteColor];
        _nameLabel.text = @"18506828082";
    }
    return _nameLabel;
}

- (UIButton *)addAccountBtn {
    if (!_addAccountBtn) {
        _addAccountBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _addAccountBtn.titleLabel.font = BYSystemFont(14);
        [_addAccountBtn setTitle:@"切换账户" forState:(UIControlStateNormal)];
        [_addAccountBtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5] forState:(UIControlStateNormal)];
        @weakify(self);
        [[_addAccountBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
//            BYSettingCtrl *vc = [[BYSettingCtrl alloc] init];
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.rootVC.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _addAccountBtn;
}

- (MineTitlePriceView *)leftView {
    if (!_leftView) {
        _leftView = [[MineTitlePriceView alloc] init];
        _leftView.titleStr = @"币币账户";
        _leftView.priceStr = @"0.000000000";
    }
    return _leftView;
}

- (MineTitlePriceView *)rightView {
    if (!_rightView) {
        _rightView = [[MineTitlePriceView alloc] init];
        _rightView.titleStr = @"合约账户权益";
        _rightView.priceStr = @"0.0000";
    }
    return _rightView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

//设置渐变背景色
- (void)drawRect:(CGRect)rect {
    /**
     *  1.通过CAGradientLayer 设置渐变的背景。
     */
    CAGradientLayer *layer = [CAGradientLayer new];
    //colors存放渐变的颜色的数组
    layer.colors = @[(__bridge id)[UIColor by_colorWithHexString:c_darkSkyBlue].CGColor, (__bridge id)[UIColor by_colorWithHexString:c_softBlue].CGColor];
    /**
     * 起点和终点表示的坐标系位置，(0,0)表示左上角，(1,1)表示右下角
     */
    layer.startPoint = CGPointMake(0, 0.5);
    layer.endPoint = CGPointMake(1, 0.5);
    layer.frame = self.bounds;
    layer.zPosition = -0.1;
    [self.layer addSublayer:layer];
}


@end
