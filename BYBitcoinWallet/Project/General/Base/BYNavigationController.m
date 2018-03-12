//
//  BYNavigationController.m
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/5/9.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import "BYNavigationController.h"

@interface BYNavigationController () <UINavigationControllerDelegate>
@property (nonatomic, getter = isPushing) BOOL pushing; //记录push标志
@end

@implementation BYNavigationController

#pragma mark -
#pragma mark - Override Method
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSString *canPush = [[NSUserDefaults standardUserDefaults] objectForKey:@"canPush"];
//    //&& ![[NSString stringWithUTF8String:object_getClassName([viewController class])] isEqualToString:@"DXThumbnailViewController"]
//    if (self.pushing == YES && ![canPush isEqualToString:@"1"]) {
//        NSLog(@"被拦截");
//        return;
//    } else {
//        NSLog(@"push");
//        self.pushing = YES;
//    }
//    [super pushViewController:viewController animated:animated];
//}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.pushing = NO;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma mark -
#pragma mark - Customer Method

@end
