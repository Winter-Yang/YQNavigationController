//
//  YQBaseNavigationController.m
//  YQNavigationController
//
//  Created by 杨雯德 on 16/2/17.
//  Copyright © 2016年 杨雯德. All rights reserved.
//

#import "YQBaseNavigationController.h"

@interface YQBaseNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;



@end

@implementation YQBaseNavigationController

static YQBaseNavigationController *baseNavigationController;

+ (instancetype)shareNavgationController {
    
    if (!baseNavigationController) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            baseNavigationController = [[YQBaseNavigationController alloc] init];
        });
    }
    
    return baseNavigationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.delegate = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.fullScreenPopGestureEnable) {
        id target = self.interactivePopGestureRecognizer.delegate;
        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
        [self.view addGestureRecognizer:self.popPanGesture];
        self.popPanGesture.maximumNumberOfTouches = 1;
        self.interactivePopGestureRecognizer.enabled = NO;
    } else {
        self.interactivePopGestureRecognizer.delegate = self;
    }
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
//解决某些情况push会卡死的情况
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    BOOL isRootVC = viewController == navigationController.viewControllers.firstObject;
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    if (self.fullScreenPopGestureEnable) {
        if (isRootVC) {
            [self.popPanGesture removeTarget:target action:action];
        } else {
            [self.popPanGesture addTarget:target action:action];
        }
    } else {
        [self.popPanGesture removeTarget:target action:action];
    }
    self.interactivePopGestureRecognizer.enabled = !isRootVC;
}

//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
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
