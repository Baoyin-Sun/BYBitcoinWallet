//
//  MarketSettingCtrl.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/24.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MarketSettingCtrl.h"
#import "HMSegmentedControl.h"
#import "MarketSettingCell.h"

@interface MarketSettingCtrl () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HMSegmentedControl *navigator;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MarketSettingCtrl

#pragma mark -
#pragma mark - override method
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - private method
- (void)by_layoutNavigation {
    [self hideNavigationBar:NO animated:NO];
    [self layoutNavigationBar:nil titleColor:nil titleFont:nil leftBarButtonItem:self.backItem rightBarButtonItem:nil];
    self.navigationItem.title = @"价格预计设置";
}

- (void)by_handelBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)by_setupSubviews {
    [self.view addSubview:self.navigator];
    [self.view addSubview:self.tableView];
    
    [self.navigator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(by_autoResize(44));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigator.mas_bottom);
        make.left.bottom.right.mas_equalTo(self.view);
    }];
}

- (void)by_bindViewModel {
    
}


#pragma mark -
#pragma mark - lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionHeaderHeight = 40;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedRowHeight = 40;
        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        
        [_tableView registerClass:[MarketSettingCell class] forCellReuseIdentifier:BYClassName(MarketSettingCell)];
        //        [_tableView registerClass:[HomePageAnnouncementCell class] forCellReuseIdentifier:BYClassName(HomePageAnnouncementCell)];
        //        [_tableView registerClass:[HomePageDealCell class] forCellReuseIdentifier:BYClassName(HomePageDealCell)];
        //        [_tableView registerClass:[HomePageDIGICCYListCell class] forCellReuseIdentifier:BYClassName(HomePageDIGICCYListCell)];
        //        [_tableView registerClass:[HomePageAdvertisingCell class] forCellReuseIdentifier:BYClassName(HomePageAdvertisingCell)];
    }
    return _tableView;
}

- (HMSegmentedControl *) navigator {
    if (!_navigator) {
        NSArray *titles = @[@"币币交易", @"合约交易"];
        _navigator = [[HMSegmentedControl alloc] initWithSectionTitles:titles];
        [_navigator addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _navigator;
}

#pragma mark -
#pragma mark - UITabelViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MarketSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(MarketSettingCell) forIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark - Navigator delegate
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
}

@end
