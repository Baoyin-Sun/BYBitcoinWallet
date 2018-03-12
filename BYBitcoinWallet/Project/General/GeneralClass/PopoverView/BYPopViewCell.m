//
//  BYPopViewCell.m
//  BYBitcoinWallet
//
//  Created by BaoYin on 2018/2/5.
//  Copyright © 2018年 BaoYin Sun. All rights reserved.
//

#import "BYPopViewCell.h"

// extern
float const PopoverViewCellHorizontalMargin = 15.f;      ///< 水平边距
float const PopoverViewCellVerticalMargin = 3.f;         ///< 垂直边距
float const PopoverViewCellTitleLeftEdge = 8.f;      ///< 标题左边边距

@interface BYPopViewCell ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, weak) UIView *bottomLine;

@end

@implementation BYPopViewCell

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = self.backgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // initialize
    [self initialize];
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.backgroundColor = _style == PopoverViewStyleDefault ? [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00] : [UIColor colorWithRed:0.23 green:0.23 blue:0.23 alpha:1.00];
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            self.backgroundColor = [UIColor clearColor];
        }];
    }
}

#pragma mark - Setter
- (void)setStyle:(PopoverViewStyle)style {
    _style = style;
    _bottomLine.backgroundColor = [self.class bottomLineColorForStyle:style];
    if (_style == PopoverViewStyleDefault) {
        [_button setTitleColor:[UIColor by_colorWithHexString:c_black] forState:UIControlStateNormal];
    } else {
        [_button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    }
}

- (void)setMode:(PopoverViewMode)mode {
    _mode = mode;
    _button.contentHorizontalAlignment = _mode == PopoverViewModeDefault?UIControlContentHorizontalAlignmentCenter:UIControlContentHorizontalAlignmentLeft;
}

#pragma mark - Private
// 初始化
- (void)initialize {
    // UI
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.userInteractionEnabled = NO; // has no use for UserInteraction.
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    _button.titleLabel.font = [self.class titleFont];
    _button.backgroundColor = self.contentView.backgroundColor;
    _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.contentView addSubview:_button];
    // Constraint
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.leading.offset(by_autoResize(15));
        make.trailing.offset(by_autoResize(-15));
    }];
    //不使用masonry添加约束的办法 自适应文字宽度
    //    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_button]-margin-|" options:kNilOptions metrics:@{@"margin" : @(PopoverViewCellHorizontalMargin)} views:NSDictionaryOfVariableBindings(_button)]];
    //    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[_button]-margin-|" options:kNilOptions metrics:@{@"margin" : @(PopoverViewCellVerticalMargin)} views:NSDictionaryOfVariableBindings(_button)]];
    // 底部线条
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor by_colorWithHexString:c_whiteTwo_line];
    bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:bottomLine];
    _bottomLine = bottomLine;
    // Constraint
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(10);
        make.trailing.offset(-10);
        make.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    //不使用masonry添加约束的办法
    //    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomLine]|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(bottomLine)]];
    //    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomLine(lineHeight)]|" options:kNilOptions metrics:@{@"lineHeight" : @(1/[UIScreen mainScreen].scale)} views:NSDictionaryOfVariableBindings(bottomLine)]];
}

#pragma mark - Public
/*! @brief 标题字体 */
+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:15.f];
}

/*! @brief 底部线条颜色 */
+ (UIColor *)bottomLineColorForStyle:(PopoverViewStyle)style {
    return style == PopoverViewStyleDefault ? [UIColor by_colorWithHexString:c_whiteTwo_line] : [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.00];
}

- (void)setAction:(BYPopViewAction *)action {
    
    if ([action.imageUrl length] > 0) {
        [_button sd_setImageWithURL:[NSURL URLWithString:action.imageUrl] forState:UIControlStateNormal];
    }
    if (action.image) {
        [_button setImage:action.image forState:UIControlStateNormal];
    }
    if (action.iconAndtitle) {
        [_button setAttributedTitle:action.iconAndtitle forState:UIControlStateNormal];
    } else {
        [_button setTitle:action.title forState:UIControlStateNormal];
    }
    _button.titleEdgeInsets = action.image||action.imageUrl ? UIEdgeInsetsMake(0, PopoverViewCellTitleLeftEdge, 0, -PopoverViewCellTitleLeftEdge) : UIEdgeInsetsZero;
}

- (void)showBottomLine:(BOOL)show {
    _bottomLine.hidden = !show;
}

@end