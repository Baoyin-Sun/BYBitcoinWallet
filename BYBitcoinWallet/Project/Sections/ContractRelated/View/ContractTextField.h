//
//  ContractTextField.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/1.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYView.h"

@interface ContractTextField : BYView

@property (nonatomic, copy) NSString *priceStr;
@property (nonatomic, copy) NSString *unitStr;
@property (nonatomic, assign) BOOL isSelect;    

@end
