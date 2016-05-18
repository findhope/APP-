//
//  ZHYNavController.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYNavController.h"

@interface ZHYNavController ()

@end

@implementation ZHYNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize{
    
    /** 设置UINavigationBar */
    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    // 设置标题文字属性
    barAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    barAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:barAttrs];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    self.navigationBar.hidden = YES;
    //    if (不是第一个push进来的子控制器) {
    if (self.childViewControllers.count >= 1) {
        
        self.navigationBar.hidden = NO;
        
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton setFrame:CGRectMake(-10, 0, 22, 20)];
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];

}

- (void)backButtonClick{

    [self popViewControllerAnimated:YES];

}

@end
