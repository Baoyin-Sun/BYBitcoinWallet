//
//  MarketBaseCtrl.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/19.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "MarketBaseCtrl.h"
#import "OKEXMarketCtrl.h"
#import "GlobalMarketCtrl.h"
#import "MarketSettingCtrl.h"

@interface MarketBaseCtrl ()

@property (nonatomic, strong) UISegmentedControl *segmentView;
@property (nonatomic, strong) UIButton *settingButton;

@property (nonatomic, strong) OKEXMarketCtrl *okexCtrl;
@property (nonatomic, strong) GlobalMarketCtrl *globalCtrl;

@end

@implementation MarketBaseCtrl

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
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.settingButton];
    [self layoutNavigationBar:nil titleColor:nil titleFont:nil leftBarButtonItem:nil rightBarButtonItem:rightItem];
    self.navigationItem.titleView = self.segmentView;
}

- (void)by_setupSubviews {
    [self addChildViewController:self.globalCtrl];
    [self addChildViewController:self.okexCtrl];
    
    [self.view addSubview:self.globalCtrl.view];
    [self.view addSubview:self.okexCtrl.view];
}

- (void)by_bindViewModel {
    
}

#pragma mark -
#pragma mark - lazy loading
- (UISegmentedControl *)segmentView {
    if (!_segmentView) {
        NSArray *items = @[@"OKEX", @"全球"];
        _segmentView = [[UISegmentedControl alloc] initWithItems:items];
        _segmentView.tintColor = [UIColor by_colorWithHexString:c_darkSkyBlue];
        [_segmentView setWidth:by_autoResize(76) forSegmentAtIndex:0];
        [_segmentView setWidth:by_autoResize(76) forSegmentAtIndex:1];
        //默认选中的位置
        _segmentView.selectedSegmentIndex = 0;
        //监听点击
        [_segmentView addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentView;
}

- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _settingButton.frame = CGRectMake(0, 0, 30, 44);
        _settingButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:by_autoResize(22)];
        [_settingButton setTitle:@"\U0000e6c2" forState:(UIControlStateNormal)];
        [_settingButton setTitleColor:[UIColor by_colorWithHexString:c_darkSkyBlue] forState:(UIControlStateNormal)];
        @weakify(self);
        [[_settingButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            @strongify(self);
            MarketSettingCtrl *vc = [[MarketSettingCtrl alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _settingButton;
}

- (OKEXMarketCtrl *)okexCtrl {
    if (!_okexCtrl) {
        _okexCtrl = [[OKEXMarketCtrl alloc] init];
    }
    return _okexCtrl;
}

- (GlobalMarketCtrl *)globalCtrl {
    if (!_globalCtrl) {
        _globalCtrl = [[GlobalMarketCtrl alloc] init];
    }
    return _globalCtrl;
}

#pragma mark -
#pragma mark -
/**
 *  segmentChanged
 */
- (void)segmentChange:(UISegmentedControl *)sgc{
    switch (sgc.selectedSegmentIndex) {
        case 0: {
            [self replaceFromOldViewController:self.globalCtrl toNewViewController:self.okexCtrl];
            break;
        }
        case 1: {
            [self replaceFromOldViewController:self.okexCtrl toNewViewController:self.globalCtrl];
            break;
        }
        default:
            break;
    }
}

/**
 *  实现控制器的切换
 *
 *  @param oldVc 当前控制器
 *  @param newVc 要切换到的控制器
 */
- (void)replaceFromOldViewController:(UIViewController *)oldVc toNewViewController:(UIViewController *)newVc{
    /**
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的子视图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)UIViewAnimationOptionTransitionCrossDissolve
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    [self addChildViewController:newVc];
    [self transitionFromViewController:oldVc toViewController:newVc duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newVc didMoveToParentViewController:self];
            [oldVc willMoveToParentViewController:nil];
            [oldVc removeFromParentViewController];
        }
    }];
}

@end
