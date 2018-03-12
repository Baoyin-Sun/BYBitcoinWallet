//
//  CoinDealView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/29.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "CoinDealView.h"
#import "LimitLengthTextField.h"
#import "CoinDealNewsCell.h"

@interface CoinDealView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *dealTypeView;
@property (nonatomic, strong) UILabel *dealTypeLabel;
@property (nonatomic, strong) UILabel *arrowLabel;
@property (nonatomic, strong) LimitLengthTextField *priceTF;
@property (nonatomic, strong) LimitLengthTextField *numberTF;
@property (nonatomic, strong) UILabel *referencePriceLabel;
@property (nonatomic, strong) UILabel *referenceRemindLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, strong) UILabel *usableLabel;
@property (nonatomic, strong) UILabel *usableNumberLabel;
@property (nonatomic, strong) UILabel *buyableLabel;
@property (nonatomic, strong) UILabel *buyableNumberLabel;
@property (nonatomic, strong) UIButton *dealButton;
@property (nonatomic, strong) UIButton *topUpButton;
@property (nonatomic, strong) UITableView *topTableView;
@property (nonatomic, strong) UITableView *bottomTableView;
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLienView;
@property (nonatomic, strong) UIButton *depthBtn;

@end

@implementation CoinDealView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dealTypeView];
    [self.dealTypeView addSubview:self.dealTypeLabel];
    [self.dealTypeView addSubview:self.arrowLabel];
    [self addSubview:self.priceTF];
    [self addSubview:self.numberTF];
    [self addSubview:self.referencePriceLabel];
    [self addSubview:self.referenceRemindLabel];
    [self addSubview:self.slider];
    [self addSubview:self.sliderLabel];
    [self addSubview:self.usableLabel];
    [self addSubview:self.usableNumberLabel];
    [self addSubview:self.buyableLabel];
    [self addSubview:self.buyableNumberLabel];
    [self addSubview:self.dealButton];
    [self addSubview:self.topUpButton];
    [self addSubview:self.topTableView];
    [self addSubview:self.bottomTableView];
    [self addSubview:self.topLineView];
    [self addSubview:self.bottomLienView];
    [self addSubview:self.depthBtn];
    
    [self.dealTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(by_autoResize(15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(190), by_autoResize(30)));
    }];
    
    [self.dealTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(by_autoResize(15));
    }];
    
    [self.arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.dealTypeLabel);
        make.right.mas_equalTo(by_autoResize(-15));
    }];
    
    [self.priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dealTypeView.mas_bottom).offset(by_autoResize(15));
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(190), by_autoResize(30)));
    }];
    
    [self.numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceTF.mas_bottom).offset(by_autoResize(15));
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(190), by_autoResize(30)));
    }];
    
    [self.referencePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.dealTypeView.mas_bottom).offset(by_autoResize(12));
    }];
    
    [self.referenceRemindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.bottom.mas_equalTo(self.numberTF.mas_top).offset(by_autoResize(-12));
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.numberTF.mas_bottom).offset(by_autoResize(15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(140), by_autoResize(20)));
    }];
    
    [self.sliderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.slider);
        make.right.mas_equalTo(self.dealTypeView.mas_right);
    }];
    
    [self.usableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.slider.mas_bottom).offset(by_autoResize(12));
    }];
    
    [self.usableNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usableLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.usableLabel);
    }];
    
    [self.buyableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.usableLabel.mas_bottom).offset(by_autoResize(10));
    }];
    
    [self.buyableNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buyableLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.buyableLabel);
    }];
    
    [self.dealButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.buyableLabel.mas_bottom).offset(by_autoResize(15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(190), by_autoResize(30)));
    }];
    
    [self.topUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dealTypeView.mas_left);
        make.top.mas_equalTo(self.dealButton.mas_bottom).offset(by_autoResize(10));
        make.bottom.mas_equalTo(by_autoResize(-15));
    }];
    
    [self.topTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(by_autoResize(15));
        make.right.mas_equalTo(by_autoResize(-15));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(150), by_autoResize(100)));
    }];
    
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.topTableView);
        make.top.mas_equalTo(self.topTableView.mas_bottom).offset(by_autoResize(5));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(150), 0.5));
    }];
    
    [self.bottomTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLineView.mas_bottom).offset(by_autoResize(5));
        make.right.mas_equalTo(self.topTableView);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(150), by_autoResize(100)));
    }];
    
    [self.bottomLienView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomTableView);
        make.top.mas_equalTo(self.bottomTableView.mas_bottom).offset(by_autoResize(5));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(150), 0.5));
    }];
    
    [self.depthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomLienView.mas_bottom).offset(by_autoResize(5));
        make.right.mas_equalTo(by_autoResize(-15));
    }];
}

- (UIView *)dealTypeView {
    if (!_dealTypeView) {
        _dealTypeView = [[UIView alloc] init];
        _dealTypeView.layer.cornerRadius = by_autoResize(4);
        _dealTypeView.layer.masksToBounds = YES;
        _dealTypeView.layer.borderColor = [UIColor by_colorWithHexString:c_whiteTwo_line].CGColor;
        _dealTypeView.layer.borderWidth = 0.5;
    }
    return _dealTypeView;
}

- (UILabel *)dealTypeLabel {
    if (!_dealTypeLabel) {
        _dealTypeLabel = [[UILabel alloc] init];
        _dealTypeLabel.font = BYSystemFont(15);
        _dealTypeLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _dealTypeLabel.text = @"限价买入";
    }
    return _dealTypeLabel;
}

- (UILabel *)arrowLabel {
    if (!_arrowLabel) {
        _arrowLabel = [[UILabel alloc] init];
        _arrowLabel.textColor = [UIColor by_colorWithHexString:c_warmGrey];
        _arrowLabel.font = BYCustomFont(14);
        _arrowLabel.text = @"\U0000e686";
        _arrowLabel.textAlignment = NSTextAlignmentRight;
    }
    return _arrowLabel;
}


- (LimitLengthTextField *)priceTF {
    if (!_priceTF) {
        _priceTF = [[LimitLengthTextField alloc] init];
        _priceTF.layer.cornerRadius = by_autoResize(2);
        _priceTF.layer.masksToBounds = YES;
        _priceTF.layer.borderWidth = 0.5;
        _priceTF.layer.borderColor = [UIColor by_colorWithHexString:c_whiteTwo_line].CGColor;
        _priceTF.textColor = [UIColor by_colorWithHexString:c_black];
        _priceTF.textAlignment = NSTextAlignmentCenter;
        _priceTF.placeholder = @"价格";
    }
    return _priceTF;
}

- (LimitLengthTextField *)numberTF {
    if (!_numberTF) {
        _numberTF = [[LimitLengthTextField alloc] init];
        _numberTF.layer.cornerRadius = by_autoResize(2);
        _numberTF.layer.masksToBounds = YES;
        _numberTF.layer.borderWidth = 0.5;
        _numberTF.layer.borderColor = [UIColor by_colorWithHexString:c_whiteTwo_line].CGColor;
        _numberTF.textColor = [UIColor by_colorWithHexString:c_black];
        _numberTF.textAlignment = NSTextAlignmentCenter;
        _numberTF.placeholder = @"数量";
    }
    return _numberTF;
}

- (UILabel *)referencePriceLabel {
    if (!_referencePriceLabel) {
        _referencePriceLabel = [[UILabel alloc] init];
        _referencePriceLabel.font = BYSystemFont(13);
        _referencePriceLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _referencePriceLabel.text = @"参考市场价格 0.03030000";
        _referencePriceLabel.hidden = YES;
    }
    return _referencePriceLabel;
}

- (UILabel *)referenceRemindLabel {
    if (!_referenceRemindLabel) {
        _referenceRemindLabel = [[UILabel alloc] init];
        _referenceRemindLabel.font = BYSystemFont(14);
        _referenceRemindLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _referenceRemindLabel.text = @"以市场成交价为准";
        _referenceRemindLabel.hidden = YES;
    }
    return _referenceRemindLabel;
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] init];
    }
    return _slider;
}

- (UILabel *)sliderLabel {
    if (!_sliderLabel) {
        _sliderLabel = [[UILabel alloc] init];
        _sliderLabel.textAlignment = NSTextAlignmentRight;
        _sliderLabel.font = BYSystemFont(12);
        _sliderLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _sliderLabel.text = @"0%";
    }
    return _sliderLabel;
}

- (UILabel *)usableLabel {
    if (!_usableLabel) {
        _usableLabel = [[UILabel alloc] init];
        _usableLabel.font = BYSystemFont(12);
        _usableLabel.textColor = [UIColor by_colorWithHexString:c_brownishGrey];
        _usableLabel.text = @"可用BTC";
    }
    return _usableLabel;
}

- (UILabel *)usableNumberLabel {
    if (!_usableNumberLabel) {
        _usableNumberLabel = [[UILabel alloc] init];
        _usableNumberLabel.font = BYSystemFont(12);
        _usableNumberLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _usableNumberLabel.text = @"0.00000000";
    }
    return _usableNumberLabel;
}

- (UILabel *)buyableLabel {
    if (!_buyableLabel) {
        _buyableLabel = [[UILabel alloc] init];
        _buyableLabel.font = BYSystemFont(12);
        _buyableLabel.textColor = BYCustomColor(c_brownishGrey);
        _buyableLabel.text = @"可用LTC";
    }
    return _buyableLabel;
}

- (UILabel *)buyableNumberLabel {
    if (!_buyableNumberLabel) {
        _buyableNumberLabel = [[UILabel alloc] init];
        _buyableNumberLabel.font = BYSystemFont(12);
        _buyableNumberLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _buyableNumberLabel.text = @"0.00000000";
    }
    return _buyableNumberLabel;
}

- (UIButton *)dealButton {
    if (!_dealButton) {
        _dealButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _dealButton.backgroundColor = [UIColor lightGrayColor];
        _dealButton.layer.cornerRadius = by_autoResize(15);
        _dealButton.layer.masksToBounds = YES;
        _dealButton.titleLabel.font = BYSystemFont(15);
        [_dealButton setTitle:@"买入LTC" forState:(UIControlStateNormal)];
        [_dealButton setTitleColor:BYSystemColor(whiteColor) forState:(UIControlStateNormal)];
    }
    return _dealButton;
}

- (UIButton *)topUpButton {
    if (!_topUpButton) {
        _topUpButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _topUpButton.titleLabel.font = BYSystemFont(13);
        [_topUpButton setTitle:@"充值BTC" forState:(UIControlStateNormal)];
        [_topUpButton setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateNormal)];
    }
    return _topUpButton;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        _topLineView.backgroundColor = BYCustomColor(c_whiteTwo_line);
    }
    return _topLineView;
}

- (UIView *)bottomLienView {
    if (!_bottomLienView) {
        _bottomLienView = [[UIView alloc] init];
        _bottomLienView.backgroundColor = BYCustomColor(c_whiteTwo_line);
    }
    return _bottomLienView;
}

- (UIButton *)depthBtn {
    if (!_depthBtn) {
        _depthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _depthBtn.titleLabel.font = BYCustomFont(13);
        [_depthBtn setTitle:@"深度  \U0000e686" forState:UIControlStateNormal];
        [_depthBtn setTitle:@"深度  \U0000e685" forState:(UIControlStateSelected)];
        [_depthBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        @weakify(self);
        [[_depthBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.depthBtn.selected = !self.depthBtn.selected;
        }];
    }
    return _depthBtn;
}

- (UITableView *)topTableView {
    if (!_topTableView) {
        _topTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _topTableView.delegate = self;
        _topTableView.dataSource = self;
        _topTableView.estimatedSectionHeaderHeight = 0;
        _topTableView.estimatedSectionFooterHeight = 0;
        _topTableView.estimatedRowHeight = 20;
        _topTableView.sectionHeaderHeight = 0.0001;
        _topTableView.sectionFooterHeight = 0.0001;
        _topTableView.rowHeight = 20;
        _topTableView.showsVerticalScrollIndicator = NO;
        _topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _topTableView.scrollEnabled = NO;
        
        [_topTableView registerClass:[CoinDealNewsCell class] forCellReuseIdentifier:BYClassName(CoinDealNewsCell)];
    }
    return _topTableView;
}

- (UITableView *)bottomTableView {
    if (!_bottomTableView) {
        _bottomTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _bottomTableView.delegate = self;
        _bottomTableView.dataSource = self;
        _bottomTableView.estimatedSectionHeaderHeight = 0;
        _bottomTableView.estimatedSectionFooterHeight = 0;
        _bottomTableView.estimatedRowHeight = 20;
        _bottomTableView.sectionHeaderHeight = 0.0001;
        _bottomTableView.sectionFooterHeight = 0.0001;
        _bottomTableView.rowHeight = 20;
        _bottomTableView.showsVerticalScrollIndicator = NO;
        _bottomTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bottomTableView.scrollEnabled = NO;
        
        [_bottomTableView registerClass:[CoinDealNewsCell class] forCellReuseIdentifier:BYClassName(CoinDealNewsCell)];
    }
    return _bottomTableView;
}


#pragma mark -
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoinDealNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(CoinDealNewsCell) forIndexPath:indexPath];
    cell.isTop = [tableView isEqual:self.topTableView];
    return cell;
}


@end
