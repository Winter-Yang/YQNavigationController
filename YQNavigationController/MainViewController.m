//
//  MainViewController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "MainViewController.h"
#import "YQNavifationController.h"
#import "YQViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YQViewController *firstVC = [[YQViewController alloc] init];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    firstVC.title = @"First";
    firstVC.tabBarItem = firstItem;
    YQNavifationController *firstNav = [[YQNavifationController alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"测试";
    self.viewControllers = @[firstNav];
    self.tabBarController.tabBar.translucent = YES;
    
    
    
    YQViewController *secVC = [[YQViewController alloc] init];
    UITabBarItem *secItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    secVC.title = @"First";
    secVC.tabBarItem = secItem;
    YQNavifationController *secNav = [[YQNavifationController alloc] initWithRootViewController:secVC];
    secNav.tabBarItem.title = @"测试1";
    self.viewControllers = @[firstNav,secNav];
    self.tabBarController.tabBar.translucent = YES;

    
}

@end
