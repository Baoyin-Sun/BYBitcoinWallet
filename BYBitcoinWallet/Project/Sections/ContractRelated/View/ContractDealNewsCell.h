//
//  ContractDealNewsCell.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/2.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYTableViewCell.h"

@interface ContractDealNewsCell : BYTableViewCell

@property (nonatomic, copy) NSString *countStr;
@property (nonatomic, copy) NSString *priceStr;
@property (nonatomic, copy) NSString *numberStr;

@property (nonatomic, assign) BOOL isTop;

@end
