//
//  MineCtrl.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MineCtrl.h"
#import "MineTitleView.h"
#import "MineTabCell.h"
#import "MineDefaultCell.h"
#import "MineLogOutCell.h"

@interface MineCtrl () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) MineTitleView *titleView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation MineCtrl

#pragma mark -
#pragma mark - override method
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"okex");
}

#pragma mark -
#pragma mark - private method
- (void)by_layoutNavigation {
    [self hideNavigationBar:YES animated:NO];
    [self layoutNavigationBar:nil titleColor:nil titleFont:nil leftBarButtonItem:nil rightBarButtonItem:nil];
}

- (void)by_setupSubviews {
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.tableView];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(by_autoResize(-20));
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(by_autoResize(200));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.left.bottom.right.mas_equalTo(self.view);
    }];
}

- (void)by_bindViewModel {
    self.dataSource = @[@{
                             @"titleName" : @"安全中心",
                             @"imageName" : @"\U0000e67c"
                             },
                         @{
                             @"titleName" : @"身份验证",
                             @"imageName" : @"\U0000e771"
                             },
                         @{
                             @"titleName" : @"费率以及汇率详情",
                             @"imageName" : @"\U0000e764"
                             },
                         @{
                             @"titleName" : @"建议反馈",
                             @"imageName" : @"\U0000e775"
                             },
                         @{
                             @"titleName" : @"地址管理",
                             @"imageName" : @"\U0000e773"
                             },
                        @{
                            @"titleName" : @"版本更新",
                            @"imageName" : @"\U0000e773"
                            },
                        @{
                            @"titleName" : @"关于",
                            @"imageName" : @"\U0000e773"
                            }
                        ];
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
        
        [_tableView registerClass:[MineTabCell class] forCellReuseIdentifier:BYClassName(MineTabCell)];
        [_tableView registerClass:[MineDefaultCell class] forCellReuseIdentifier:BYClassName(MineDefaultCell)];
        [_tableView registerClass:[MineLogOutCell class] forCellReuseIdentifier:BYClassName(MineLogOutCell)];
    }
    return _tableView;
}

- (MineTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[MineTitleView alloc] init];
        _titleView.layer.cornerRadius = by_autoResize(15);
        _titleView.layer.masksToBounds = YES;
    }
    return _titleView;
}


#pragma mark -
#pragma mark - UITabelViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 7;
        default:
            return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return by_autoResize(10);
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor clearColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return UITableViewAutomaticDimension;
    }
    return by_autoResize(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MineTabCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(MineTabCell) forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.titleArr = @[@{@"title" : @"充值", @"image" : @""}, @{@"title" : @"提现", @"image" : @""}, @{@"title" : @"资金划转", @"image" : @""}];
        } else {
            cell.titleArr = @[@{@"title" : @"币币账单", @"image" : @""}, @{@"title" : @"合约账单", @"image" : @""}, @{@"title" : @"交割记录", @"image" : @""}];
        }
        return cell;
    } else if (indexPath.section == 1) {
       MineDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(MineDefaultCell) forIndexPath:indexPath];
        cell.dic = self.dataSource[indexPath.row];
        return cell;
    } else {
        MineLogOutCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(MineLogOutCell) forIndexPath:indexPath];
        return cell;
    }
}


@end
