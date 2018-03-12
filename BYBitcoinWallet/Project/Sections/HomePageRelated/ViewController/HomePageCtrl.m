//
//  HomePageCtrl.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageCtrl.h"
#import "HomePageTitleView.h"
#import "TYCyclePagerView.h"
#import "BYCyclePagerViewCell.h"
#import "HomePageMarketTabCell.h"
#import "HomePageAnnouncementCell.h"
#import "HomePageDIGICCYListCell.h"
#import "HomePageDealView.h"
#import "HomePageDealCell.h"
#import "HomePageUpsNoticeView.h"
#import "HomePageAdvertisingCell.h"

@interface HomePageCtrl () <UITableViewDelegate, UITableViewDataSource, TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) HomePageTitleView *titleView;
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) HomePageDealView *dealSectionView;
@property (nonatomic, strong) HomePageUpsNoticeView *upsNoticeView;

@end

@implementation HomePageCtrl

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
}

#pragma mark -
#pragma mark - private method
- (void)by_layoutNavigation {
    [self hideNavigationBar:NO animated:NO];
    [self layoutNavigationBar:nil titleColor:nil titleFont:nil leftBarButtonItem:nil rightBarButtonItem:nil];
    self.navigationItem.title = @"";
    
    self.navigationItem.titleView = self.titleLabel;
}

- (void)by_setupSubviews {
    [self.view addSubview:self.tableView];
    [self.bgView addSubview:self.titleView];
    [self.bgView addSubview:self.pagerView];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(by_autoResize(30));
    }];
    
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(by_autoResize(150));
    }];
    
    self.tableView.tableHeaderView = nil;
    self.tableView.tableHeaderView = self.bgView;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)by_bindViewModel {
    
}


#pragma mark -
#pragma mark - lazy loading
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = BYSystemFont(16);
//        _titleLabel.textColor = [UIColor by_colorWithHexString:c_black];
        _titleLabel.text = @"OKEx";
        _titleLabel.alpha = 0;
    }
    return _titleLabel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionHeaderHeight = 40;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedRowHeight = 40;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.bgView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        
        [_tableView registerClass:[HomePageMarketTabCell class] forCellReuseIdentifier:BYClassName(HomePageMarketTabCell)];
        [_tableView registerClass:[HomePageAnnouncementCell class] forCellReuseIdentifier:BYClassName(HomePageAnnouncementCell)];
        [_tableView registerClass:[HomePageDealCell class] forCellReuseIdentifier:BYClassName(HomePageDealCell)];
        [_tableView registerClass:[HomePageDIGICCYListCell class] forCellReuseIdentifier:BYClassName(HomePageDIGICCYListCell)];
        [_tableView registerClass:[HomePageAdvertisingCell class] forCellReuseIdentifier:BYClassName(HomePageAdvertisingCell)];
    }
    return _tableView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BYScreen_width, by_autoResize(180))];
    }
    return _bgView;
}

- (HomePageTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[HomePageTitleView alloc] init];
    }
    return _titleView;
}

- (TYCyclePagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[TYCyclePagerView alloc] init];
        _pagerView.backgroundColor = [UIColor whiteColor];
        _pagerView.isInfiniteLoop = YES;
        _pagerView.autoScrollInterval = 3.0;
        _pagerView.dataSource = self;
        _pagerView.delegate = self;
        [_pagerView registerClass:[BYCyclePagerViewCell class] forCellWithReuseIdentifier:BYClassName(BYCyclePagerViewCell)];
    }
    return _pagerView;
}

- (HomePageDealView *)dealSectionView {
    if (!_dealSectionView) {
        _dealSectionView = [[HomePageDealView alloc] init];
    }
    return _dealSectionView;
}

- (HomePageUpsNoticeView *)upsNoticeView {
    if (!_upsNoticeView) {
        _upsNoticeView = [[HomePageUpsNoticeView alloc] init];
    }
    return _upsNoticeView;
}

#pragma mark -
#pragma mark - UIScrollView
- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat marginTop = 150;
    if (marginTop != scrollView.contentInset.top) {
        marginTop = scrollView.contentInset.top;
    }
    
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat newoffsetY = offsetY + marginTop;
    
    if (newoffsetY >= 0 && newoffsetY <= 150) {
         self.titleLabel.alpha = 1 - (0.1 / scrollView.contentOffset.y);
    }
}

#pragma mark -
#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 5;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2 || section == 3) {
        return UITableViewAutomaticDimension;
    }
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3 || section == 4) {
        return by_autoResize(10);
    }
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return self.dealSectionView;
    } else if (section == 3) {
        return self.upsNoticeView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomePageMarketTabCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(HomePageMarketTabCell) forIndexPath:indexPath];
        cell.numbers = 6;
        return cell;
    } else if (indexPath.section == 1) {
        HomePageAnnouncementCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(HomePageAnnouncementCell) forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 2) {
        HomePageDealCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(HomePageDealCell) forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 3) {
        HomePageDIGICCYListCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(HomePageDIGICCYListCell) forIndexPath:indexPath];
        return cell;
    } else {
        HomePageAdvertisingCell *cell = [tableView dequeueReusableCellWithIdentifier:BYClassName(HomePageAdvertisingCell) forIndexPath:indexPath];
        cell.logoArr = @[];
        return cell;
    }
}

#pragma mark -
#pragma mark - TYCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return 5;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    BYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:BYClassName(BYCyclePagerViewCell) forIndex:index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(pageView.width * 0.85, pageView.height * 0.85);
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
    layout.itemHorizontalCenter = YES;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
//    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

@end
