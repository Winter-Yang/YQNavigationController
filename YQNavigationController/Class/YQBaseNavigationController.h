//
//  YQBaseNavigationController.h
//  YQNavigationController
//
//  Created by 杨雯德 on 16/2/17.
//  Copyright © 2016年 杨雯德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQBaseNavigationController : UINavigationController
+ (instancetype)shareNavgationController;

@property (nonatomic, assign) BOOL fullScreenPopGestureEnable; /**<是否开启全屏侧滑返回手势*/

@property (nonatomic, strong) UIImage *backButtonImage; /**<返回按钮图片*/

//@property (nonatomic, copy) NSArray<UIViewController *> *rootViewControllers; /**<真正的viewControllers*/

@end
