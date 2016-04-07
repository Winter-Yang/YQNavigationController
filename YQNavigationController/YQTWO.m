//
//  YQTWO.m
//  YQNavigationController
//
//  Created by 杨雯德 on 16/4/7.
//  Copyright © 2016年 杨雯德. All rights reserved.
//

#import "YQTWO.h"
#import "UIColor+RandomColor.h"
#import "YQThree.h"
@implementation YQTWO
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"title";
    self.view.backgroundColor = [UIColor randomColor];
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];




    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor randomColor];
    [btn setTitle:@"pop" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 200, 100, 40);
    btn1.backgroundColor = [UIColor randomColor];
    [btn1 setTitle:@"popindex" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(popindex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 300, 100, 40);
    btn2.backgroundColor = [UIColor randomColor];
    [btn2 setTitle:@"poproot" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(poproot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    // Do any additional setup after loading the view.
}
-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)popindex
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}
-(void)poproot
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didTapNextButton {

    NSLog(@"%@",self.navigationController.viewControllers);

    YQThree *viewController = [[YQThree alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
