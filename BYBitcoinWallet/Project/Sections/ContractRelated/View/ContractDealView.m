//
//  ContractDealView.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/1.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "ContractDealView.h"
#import "ContractTextField.h"
#import "ContractDealNewsCell.h"

@interface ContractDealView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UILabel *checkPriceLabel;
@property (nonatomic, strong) UILabel *arrowLabel;
@property (nonatomic, strong) UIButton *openPositionBtn;
@property (nonatomic, strong) UIButton *closePositionBtn;
@property (nonatomic, strong) UIButton *tenXBtn;
@property (nonatomic, strong) UIButton *twentyXBtn;
@property (nonatomic, strong) ContractTextField *priceTF;
@property (nonatomic, strong) UIButton *opponentBtn;
@property (nonatomic, strong) UIButton *buyOneBtn;
@property (nonatomic, strong) UIButton *sellOneBtn;
@property (nonatomic, strong) ContractTextField *numberTF;
@property (nonatomic, strong) UIButton *buyBtn;
@property (nonatomic, strong) UIButton *sellBtn;
@property (nonatomic, strong) UILabel *useableLabel;
@property (nonatomic, strong) UILabel *useableNumLabel;
@property (nonatomic, strong) UILabel *openableLabel;
@property (nonatomic, strong) UILabel *openableNumLabel;

@property (nonatomic, strong) UITableView *topTableView;
@property (nonatomic, strong) UITableView *bottomTableView;
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLienView;

@end

@implementation ContractDealView

- (void)by_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.checkPriceLabel];
    [self addSubview:self.arrowLabel];
    [self addSubview:self.openPositionBtn];
    [self addSubview:self.closePositionBtn];
    [self addSubview:self.tenXBtn];
    [self addSubview:self.twentyXBtn];
    [self addSubview:self.priceTF];
    [self addSubview:self.opponentBtn];
    [self addSubview:self.buyOneBtn];
    [self addSubview:self.sellOneBtn];
    [self addSubview:self.numberTF];
    [self addSubview:self.buyBtn];
    [self addSubview:self.sellBtn];
    [self addSubview:self.useableLabel];
    [self addSubview:self.useableNumLabel];
    [self addSubview:self.openableLabel];
    [self addSubview:self.openableNumLabel];
    [self addSubview:self.topTableView];
    [self addSubview:self.bottomTableView];
    [self addSubview:self.topLineView];
    [self addSubview:self.bottomLienView];
    
    [self.checkPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(by_autoResize(15));
    }];
    
    [self.arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.checkPriceLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.checkPriceLabel);
    }];
    
    [self.openPositionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.checkPriceLabel.mas_left);
        make.top.mas_equalTo(self.checkPriceLabel.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(80), by_autoResize(20)));
    }];
    
    [self.closePositionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.openPositionBtn.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.openPositionBtn);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(80), by_autoResize(20)));
    }];
    
    [self.tenXBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.openPositionBtn.mas_left);
        make.top.mas_equalTo(self.openPositionBtn.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(80), by_autoResize(20)));
    }];
    
    [self.twentyXBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tenXBtn.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.tenXBtn);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(80), by_autoResize(20)));
    }];
    
    [self.priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tenXBtn.mas_left);
        make.top.mas_equalTo(self.tenXBtn.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(170), by_autoResize(25)));
    }];
    
    [self.opponentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceTF.mas_left);
        make.top.mas_equalTo(self.priceTF.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(50), by_autoResize(20)));
    }];
    
    [self.buyOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.opponentBtn.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.opponentBtn);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(50), by_autoResize(20)));
    }];
    
    [self.sellOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buyOneBtn.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.opponentBtn);
        make.size.mas_equalTo(CGSizeMake(by_autoResize(50), by_autoResize(20)));
    }];
    
    [self.numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.opponentBtn.mas_left);
        make.top.mas_equalTo(self.opponentBtn.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(170), by_autoResize(25)));
    }];
    
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.numberTF.mas_left);
        make.top.mas_equalTo(self.numberTF.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(170), by_autoResize(30)));
    }];
    
    [self.sellBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buyBtn.mas_left);
        make.top.mas_equalTo(self.buyBtn.mas_bottom).offset(by_autoResize(10));
        make.size.mas_equalTo(CGSizeMake(by_autoResize(170), by_autoResize(30)));
    }];
    
    [self.useableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sellBtn.mas_left);
        make.top.mas_equalTo(self.sellBtn.mas_bottom).offset(by_autoResize(10));
        make.bottom.mas_equalTo(by_autoResize(-15));
    }];
    
    [self.useableNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.useableLabel.mas_right).offset(by_autoResize(5));
        make.centerY.mas_equalTo(self.useableLabel);
    }];
    
    [self.openableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.useableNumLabel.mas_right).offset(by_autoResize(10));
        make.centerY.mas_equalTo(self.useableNumLabel);
    }];
    
    [self.openableNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.openableLabel.mas_right).offset(by_autoResize(5));
        make.centerY.mas_equalTo(self.openableLabel);
    }];
    
    [self.topTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.openPositionBtn.mas_top);
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
}

- (UILabel *)checkPriceLabel {
    if (!_checkPriceLabel) {
        _checkPriceLabel = [UILabel labelWithFont:BYSystemFont(15)
                                        textColor:BYCustomColor(c_black)];
        _checkPriceLabel.text = @"限价单";
        
    }
    return _checkPriceLabel;
}

- (UILabel *)arrowLabel {
    if (!_arrowLabel) {
        _arrowLabel = [[UILabel alloc] init];
        _arrowLabel.textColor = BYCustomColor(c_warmGrey);
        _arrowLabel.font = BYCustomFont(14);
        _arrowLabel.text = @"\U0000e686";
        _arrowLabel.textAlignment = NSTextAlignmentRight;
    }
    return _arrowLabel;
}

- (UIButton *)openPositionBtn {
    if (!_openPositionBtn) {
        _openPositionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _openPositionBtn.layer.cornerRadius = by_autoResize(2);
        _openPositionBtn.layer.masksToBounds = YES;
        _openPositionBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _openPositionBtn.layer.borderWidth = 0.5;
        [_openPositionBtn setTitle:@"开仓" forState:(UIControlStateNormal)];
        [_openPositionBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_openPositionBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _openPositionBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_openPositionBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.openPositionBtn.selected = !self.openPositionBtn.selected;
            self.openPositionBtn.layer.borderColor = self.openPositionBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _openPositionBtn;
}

- (UIButton *)closePositionBtn {
    if (!_closePositionBtn) {
        _closePositionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closePositionBtn.layer.cornerRadius = by_autoResize(2);
        _closePositionBtn.layer.masksToBounds = YES;
        _closePositionBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _closePositionBtn.layer.borderWidth = 0.5;
        [_closePositionBtn setTitle:@"平仓" forState:(UIControlStateNormal)];
        [_closePositionBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_closePositionBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _closePositionBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_closePositionBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.closePositionBtn.selected = !self.closePositionBtn.selected;
            self.closePositionBtn.layer.borderColor = self.closePositionBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _closePositionBtn;
}

- (UIButton *)tenXBtn {
    if (!_tenXBtn) {
        _tenXBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _tenXBtn.layer.cornerRadius = by_autoResize(2);
        _tenXBtn.layer.masksToBounds = YES;
        _tenXBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _tenXBtn.layer.borderWidth = 0.5;
        [_tenXBtn setTitle:@"10X" forState:(UIControlStateNormal)];
        [_tenXBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_tenXBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _tenXBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_tenXBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.tenXBtn.selected = !self.tenXBtn.selected;
            self.tenXBtn.layer.borderColor = self.tenXBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _tenXBtn;
}

- (UIButton *)twentyXBtn {
    if (!_twentyXBtn) {
        _twentyXBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _twentyXBtn.layer.cornerRadius = by_autoResize(2);
        _twentyXBtn.layer.masksToBounds = YES;
        _twentyXBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _twentyXBtn.layer.borderWidth = 0.5;
        [_twentyXBtn setTitle:@"10X" forState:(UIControlStateNormal)];
        [_twentyXBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_twentyXBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _twentyXBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_twentyXBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.twentyXBtn.selected = !self.twentyXBtn.selected;
            self.twentyXBtn.layer.borderColor = self.twentyXBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _twentyXBtn;
}

- (ContractTextField *)priceTF {
    if (!_priceTF) {
        _priceTF = [[ContractTextField alloc] init];
        _priceTF.priceStr = @"价格";
        _priceTF.unitStr = @"USD";
    }
    return _priceTF;
}

- (ContractTextField *)numberTF {
    if (!_numberTF) {
        _numberTF = [[ContractTextField alloc] init];
        _numberTF.priceStr = @"数量";
        _numberTF.unitStr = @"EOS";
    }
    return _numberTF;
}

- (UIButton *)opponentBtn {
    if (!_opponentBtn) {
        _opponentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _opponentBtn.layer.cornerRadius = by_autoResize(2);
        _opponentBtn.layer.masksToBounds = YES;
        _opponentBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _opponentBtn.layer.borderWidth = 0.5;
        [_opponentBtn setTitle:@"对手价" forState:(UIControlStateNormal)];
        [_opponentBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_opponentBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _opponentBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_opponentBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.opponentBtn.selected = !self.opponentBtn.selected;
            self.opponentBtn.layer.borderColor = self.opponentBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _opponentBtn;
}

- (UIButton *)buyOneBtn {
    if (!_buyOneBtn) {
        _buyOneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyOneBtn.layer.cornerRadius = by_autoResize(2);
        _buyOneBtn.layer.masksToBounds = YES;
        _buyOneBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _buyOneBtn.layer.borderWidth = 0.5;
        [_buyOneBtn setTitle:@"买一价" forState:(UIControlStateNormal)];
        [_buyOneBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_buyOneBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _buyOneBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_buyOneBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.buyOneBtn.selected = !self.buyOneBtn.selected;
            self.buyOneBtn.layer.borderColor = self.buyOneBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _buyOneBtn;
}

- (UIButton *)sellOneBtn {
    if (!_sellOneBtn) {
        _sellOneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sellOneBtn.layer.cornerRadius = by_autoResize(2);
        _sellOneBtn.layer.masksToBounds = YES;
        _sellOneBtn.layer.borderColor = BYCustomColor(c_warmGrey).CGColor;
        _sellOneBtn.layer.borderWidth = 0.5;
        [_sellOneBtn setTitle:@"卖一价" forState:(UIControlStateNormal)];
        [_sellOneBtn setTitleColor:BYCustomColor(c_warmGrey) forState:(UIControlStateNormal)];
        [_sellOneBtn setTitleColor:BYCustomColor(c_darkSkyBlue) forState:(UIControlStateSelected)];
        _sellOneBtn.titleLabel.font = BYSystemFont(11);
        @weakify(self);
        [[_sellOneBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            self.sellOneBtn.selected = !self.sellOneBtn.selected;
            self.sellOneBtn.layer.borderColor = self.sellOneBtn.selected ? BYCustomColor(c_darkSkyBlue).CGColor : BYCustomColor(c_warmGrey).CGColor;
        }];
    }
    return _sellOneBtn;
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _buyBtn.backgroundColor = [UIColor lightGrayColor];
        _buyBtn.layer.cornerRadius = by_autoResize(15);
        _buyBtn.layer.masksToBounds = YES;
        _buyBtn.titleLabel.font = BYSystemFont(15);
        [_buyBtn setTitle:@"买入开多（看涨）" forState:(UIControlStateNormal)];
        [_buyBtn setTitleColor:BYSystemColor(whiteColor) forState:(UIControlStateNormal)];
    }
    return _buyBtn;
}

- (UIButton *)sellBtn {
    if (!_sellBtn) {
        _sellBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _sellBtn.backgroundColor = [UIColor lightGrayColor];
        _sellBtn.layer.cornerRadius = by_autoResize(15);
        _sellBtn.layer.masksToBounds = YES;
        _sellBtn.titleLabel.font = BYSystemFont(15);
        [_sellBtn setTitle:@"卖出开空（看跌）" forState:(UIControlStateNormal)];
        [_sellBtn setTitleColor:BYSystemColor(whiteColor) forState:(UIControlStateNormal)];
    }
    return _sellBtn;
}

- (UILabel *)useableLabel {
    if (!_useableLabel) {
        _useableLabel = [UILabel labelWithFont:BYSystemFont(13)
                                     textColor:BYCustomColor(c_black)];
        _useableLabel.text = @"可用";
    }
    return _useableLabel;
}

- (UILabel *)useableNumLabel {
    if (!_useableNumLabel) {
        _useableNumLabel = [UILabel labelWithFont:BYSystemFont(13)
                                     textColor:BYCustomColor(c_brownishGrey)];
        _useableNumLabel.text = @"0";
    }
    return _useableNumLabel;
}

- (UILabel *)openableLabel {
    if (!_openableLabel) {
        _openableLabel = [UILabel labelWithFont:BYSystemFont(13)
                                     textColor:BYCustomColor(c_black)];
        _openableLabel.text = @"可用";
    }
    return _openableLabel;
}

- (UILabel *)openableNumLabel {
    if (!_openableNumLabel) {
        _openableNumLabel = [UILabel labelWithFont:BYSystemFont(13)
                                        textColor:BYCustomColor(c_brownishGrey)];
        _openableNumLabel.text = @"0";
    }
    return _openableNumLabel;
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
        _topTableView.transform = CGAffineTransformMakeScale(1, -1);
        
        [_topTableView registerClass:[ContractDealNewsCell class] forCellReuseIdentifier:BYClassName(ContractDealNewsCell)];
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
        
        [_bottomTableView registerClass:[ContractDealNewsCell class] forCellReuseIdentifier:BYClassName(ContractDealNewsCell)];
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
    ContractDealNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(ContractDealNewsCell) forIndexPath:indexPath];
    cell.isTop = [tableView isEqual:self.topTableView];
    cell.countStr = [tableView isEqual:self.topTableView] ? BYFormat(@"卖%ld", indexPath.row % 5 + 1) : BYFormat(@"买%ld", indexPath.row % 5 + 1);
    if ([tableView isEqual:self.topTableView]) {
        cell.contentView.transform = CGAffineTransformMakeScale(1, -1);
    }
    return cell;
}


@end
