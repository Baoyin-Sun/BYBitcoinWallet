//
//  BYView.m
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/8/31.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import "BYView.h"
#import "BYViewModel.h"

@implementation BYView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self by_setupViews];
        [self by_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<BYViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        self.byViewModel = viewModel;
        [self by_setupViews];
        [self by_bindViewModel];
    }
    return self;
}

- (void)by_bindViewModel {}

- (void)by_setupViews {}

- (void)by_addReturnKeyBoard {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
