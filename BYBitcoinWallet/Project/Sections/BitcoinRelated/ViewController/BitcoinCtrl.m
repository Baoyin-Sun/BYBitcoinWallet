//
//  BitcoinCtrl.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BitcoinCtrl.h"
#import "HMSegmentedControl.h"
#import "CoinInfoView.h"
#import "CoinDealView.h"

@interface BitcoinCtrl ()

@property (nonatomic, strong) HMSegmentedControl *navigator;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CoinInfoView *coinInfoView;
@property (nonatomic, strong) CoinDealView *coinDealView;

@end

@implementation BitcoinCtrl

#pragma mark -
#pragma mark - override method
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[BYWebSocketManager shareManager] by_close:^(NSInteger code, NSString *reason, BOOL wasClean) {
        NSLog(@"code = %zd,reason = %@",code,reason);
    }];
}

#pragma mark -
#pragma mark - private method
- (void)by_layoutNavigation {
    [self hideNavigationBar:NO animated:NO];
    [self layoutNavigationBar:nil titleColor:nil titleFont:nil leftBarButtonItem:nil rightBarButtonItem:nil];
}

- (void)by_setupSubviews {
    [self.view addSubview:self.navigator];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.coinInfoView];
    [self.scrollView addSubview:self.coinDealView];

    [self.navigator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(by_autoResize(44));
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(by_autoResize(44), 0, 0, 0));
    }];
    
    [self.coinInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.width.mas_equalTo(BYScreen_width);
    }];
    
    [self.coinDealView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coinInfoView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(BYScreen_width);
    }];
}

- (void)by_bindViewModel {
    NSString *url = @"wss://real.okex.com:10441/websocket/ok_sub_spot_X_ticker";
    
    [[BYWebSocketManager shareManager] by_open:url connect:^{
        NSLog(@"成功连接");
        [[BYWebSocketManager shareManager] by_send:@"{'event':'addChannel','channel':'ok_sub_spot_ltc_btc_ticker'}"];
    } receive:^(id message, BYSocketReceiveType type) {
        if (type == BYSocketReceiveTypeForMessage) {
            NSLog(@"接收 类型1--%@",message);
        }
        else if (type == BYSocketReceiveTypeForPong){
            NSLog(@"接收 类型2--%@",message);
        }
    } failure:^(NSError *error) {
        NSLog(@"连接失败");
    }];
}

#pragma mark -
#pragma mark - lazy loading
- (HMSegmentedControl *) navigator {
    if (!_navigator) {
        NSArray *titles = @[@"买入", @"卖出", @"挂单", @"历史"];
        _navigator = [[HMSegmentedControl alloc] initWithSectionTitles:titles];
        [_navigator addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _navigator;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (CoinInfoView *)coinInfoView {
    if (!_coinInfoView) {
        _coinInfoView = [[CoinInfoView alloc] init];
    }
    return _coinInfoView;
}

- (CoinDealView *)coinDealView {
    if (!_coinDealView) {
        _coinDealView = [[CoinDealView alloc] init];
    }
    return _coinDealView;
}


#pragma mark -
#pragma mark -



#pragma mark -
#pragma mark - Navigator delegate
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
}

@end
