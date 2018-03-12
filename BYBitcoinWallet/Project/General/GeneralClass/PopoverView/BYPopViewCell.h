//
//  BYPopViewCell.h
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/5.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYPopViewAction.h"

UIKIT_EXTERN float const PopoverViewCellHorizontalMargin;    ///< 水平间距边距
UIKIT_EXTERN float const PopoverViewCellVerticalMargin;      ///< 垂直边距
UIKIT_EXTERN float const PopoverViewCellTitleLeftEdge;       ///< 标题左边边距

@interface BYPopViewCell : UITableViewCell

@property (nonatomic, assign) PopoverViewStyle style;
@property (nonatomic, assign) PopoverViewMode mode;

/*! @brief 标题字体
 */
+ (UIFont *)titleFont;

/*! @brief 底部线条颜色
 */
+ (UIColor *)bottomLineColorForStyle:(PopoverViewStyle)style;

- (void)setAction:(BYPopViewAction *)action;

- (void)showBottomLine:(BOOL)show;

@end
