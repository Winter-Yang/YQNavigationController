//
//  YQViewController.m
//  YQNavigationController
//
//  Created by 杨雯德 on 16/2/17.
//  Copyright © 2016年 杨雯德. All rights reserved.
//

#import "YQViewController.h"
#import "UIColor+RandomColor.h"
@interface YQViewController ()
@property(nonatomic,strong)UIScrollView *la;

@end

@implementation YQViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"index"];
//    if (str) {
//        int index = [str intValue]+1;
//        self.title = [NSString stringWithFormat:@"%d",index];
//        [[NSUserDefaults standardUserDefaults] setObject:self.title forKey:@"index"];
//    }else{
//        self.title = @"0";
//        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"index"];
//
//    }
//    
    self.title = @"title";
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
    
    self.la = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 668)];
    self.la.backgroundColor = [UIColor brownColor];
    self.la.contentSize = CGSizeMake(700, 10101);
    [self.view addSubview:self.la];
    // Do any additional setup after loading the view.
}

- (void)didTapNextButton {
    YQViewController *viewController = [[YQViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
