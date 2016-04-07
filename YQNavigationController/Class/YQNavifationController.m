//
//  YQNavifationController.m
//  YQNavigationController
//
//  Created by 杨雯德 on 16/2/17.
//  Copyright © 2016年 杨雯德. All rights reserved.
//

#import "YQNavifationController.h"
#define kDefaultBackImageName @"navibar_back"



/**
 *  控制子视图的显示
 *
 *  @param YQWrapViewController <#YQWrapViewController description#>
 *
 *  @return <#return value description#>
 */

@interface YQNavigationViewcontrollerManage : NSObject
+(YQNavigationViewcontrollerManage*)share;
@property (nonatomic,strong) NSMutableArray * viewControllers;
@end

@implementation YQNavigationViewcontrollerManage

+(YQNavigationViewcontrollerManage*)share
{
    static YQNavigationViewcontrollerManage *manage = nil;
    static dispatch_once_t onece;
    dispatch_once(&onece, ^{
        manage = [[self alloc]init];
    });
    return manage;
}

-(instancetype)init{
    if (self) {
        self.viewControllers = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
/**
 *  真正意义上的展示的导航视图
 *
 *  @return 展示的导航视图
 */
#pragma mark - YQWrapNavigationController

@interface YQWrapNavigationController : UINavigationController
@end
/**
 *  导航视图的父视图
 *
 *  @param YQWrapViewController YQWrapViewController Object
 *
 *  @return 导航视图的父视图
 */
#pragma mark - YQWrapViewController
@interface YQWrapViewController : UIViewController

+ (YQWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end



/**
 *  展示视图NavigationController
 */
@implementation YQWrapNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [[YQNavigationViewcontrollerManage share].viewControllers removeLastObject];


    NSLog(@"%lu",(unsigned long)[YQNavigationViewcontrollerManage share].viewControllers.count);
    YQWrapNavigationController *na = (YQWrapNavigationController *)self.navigationController;
    return [na popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    [[YQNavigationViewcontrollerManage share].viewControllers removeAllObjects];




    YQWrapNavigationController *na = (YQWrapNavigationController *)self.navigationController;
    return [na popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    YQWrapNavigationController *na = (YQWrapNavigationController *)self.navigationController;
    return [na popToViewController:viewController animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {




    UIImage *backButtonImage = [UIImage imageNamed:kDefaultBackImageName];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(didTapBackButton)];
    viewController.hidesBottomBarWhenPushed = YES;
    YQWrapNavigationController *na = (YQWrapNavigationController *)self.navigationController;

    YQWrapViewController * wrapVC = [YQWrapViewController wrapViewControllerWithViewController:viewController];
    [[YQNavigationViewcontrollerManage share].viewControllers addObject:wrapVC];
    [na pushViewController:wrapVC animated:animated];
}

- (void)didTapBackButton {
    YQWrapNavigationController *na = (YQWrapNavigationController *)self.navigationController;
    [na popViewControllerAnimated:YES];
}

@end

/**
 *  父视图
 */
@implementation YQWrapViewController

+ (YQWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController {
    
    YQWrapNavigationController *wrapNavController = [[YQWrapNavigationController alloc] init];
    YQWrapViewController *wrapViewController = [[YQWrapViewController alloc] init];
    [wrapViewController.view addSubview:wrapNavController.view];
    [wrapViewController addChildViewController:wrapNavController];
    wrapNavController.viewControllers = @[viewController];
    return wrapViewController;
}

@end


/**
 *  初始化方法
 */
@implementation YQNavifationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super init]) {

        YQWrapViewController * wrapVC = [YQWrapViewController wrapViewControllerWithViewController:rootViewController];
        [[YQNavigationViewcontrollerManage share].viewControllers addObject:wrapVC];
        self.viewControllers = @[wrapVC];
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
