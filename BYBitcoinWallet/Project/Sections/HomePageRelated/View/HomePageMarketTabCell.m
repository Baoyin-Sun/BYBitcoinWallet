//
//  HomePageMarketTabCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/1/21.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "HomePageMarketTabCell.h"
#import "HomePageMarketTabView.h"

@interface HomePageMarketTabCell ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation HomePageMarketTabCell

- (void)by_setupViews {
    [self.contentView addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.height.mas_equalTo(by_autoResize(50));
    }];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
//        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (void)setNumbers:(NSInteger)numbers {
    _numbers = numbers;
    
    UIView *lastView = nil;
    for (int i = 0; i < numbers; i++) {
        HomePageMarketTabView *tempView = [[HomePageMarketTabView alloc] init];
        [self.scrollView addSubview:tempView];
        [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.scrollView);
            if (lastView) {
                make.left.mas_equalTo(lastView.mas_right);
            } else {
                make.left.mas_equalTo(0);
            }
//            make.width.mas_equalTo(50);
        }];
        lastView = tempView;
    }
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(lastView.mas_right);
        make.height.mas_equalTo(lastView);
    }];
}

@end
