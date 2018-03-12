//
//  BYTableViewCell.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/8/31.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYTableViewCellProtocol <NSObject>

@optional

- (void)by_setupViews;
- (void)by_bindViewModel;

@end

@interface BYTableViewCell : UITableViewCell <BYTableViewCellProtocol>

@end
