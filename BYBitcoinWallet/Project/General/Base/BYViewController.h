//
//  BYViewController.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/5/9.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYViewModelProtocol;

@protocol BYViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id <BYViewModelProtocol>)viewModel;

- (void)by_bindViewModel;
- (void)by_setupSubviews;
- (void)by_layoutNavigation;
- (void)by_getNewData;
- (void)by_handelBack;
- (void)recoverKeyboard;

@end

@interface BYViewController : UIViewController <BYViewControllerProtocol>

/**
 *  view是否渗透导航栏
 * (YES_view渗透导航栏下／NO_view不渗透导航栏下)
 */
@property (assign,nonatomic) BOOL isExtendLayout;

@property (nonatomic, strong) UIBarButtonItem *backItem;

/**
 * 功能：设置修改StatusBar
 * 参数：（1）StatusBar样式：statusBarStyle
 *      （2）是否隐藏StatusBar：statusBarHidden
 *      （3）是否动画过渡：animated
 */

-(void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle
            statusBarHidden:(BOOL)statusBarHidden
    changeStatusBarAnimated:(BOOL)animated;

/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
-(void)hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated;

/**
 * 功能： 布局导航栏界面
 * 参数：（1）导航栏背景：backGroundImage
 *      （2）导航栏标题颜色：titleColor
 *      （3）导航栏标题字体：titleFont
 *      （4）导航栏左侧按钮：leftItem
 *      （5）导航栏右侧按钮：rightItem
 */
-(void)layoutNavigationBar:(UIImage*)backGroundImage
                titleColor:(UIColor*)titleColor
                 titleFont:(UIFont*)titleFont
         leftBarButtonItem:(UIBarButtonItem*)leftItem
        rightBarButtonItem:(UIBarButtonItem*)rightItem;

- (void)by_removeNavgationBarLine;
- (void)by_addNavgationBarLine;


@end
