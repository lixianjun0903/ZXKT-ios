//
//  ZXCustomNavigation.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXCustomNavigation.h"

@interface ZXCustomNavigation ()

@end

@implementation ZXCustomNavigation
+ (void)initialize
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    navigationBar.backgroundColor = color(235, 67, 67);
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    navigationBar.shadowImage = [[UIImage alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,kWindowWidth, 20)];
    statusBarView.backgroundColor = color(235, 67, 67);
    [self.view addSubview:statusBarView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itermWithTarget:self Action:@selector(back) Image:@"back" HighImage:@"back"];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
