//
//  ZHYTestController.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTestController.h"

@interface ZHYTestController ()

@end

@implementation ZHYTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupGroup1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    [self.navigationController popViewControllerAnimated:YES];

}

- (void)setupGroup1{

    ZHYArrowItem *item1 = [ZHYArrowItem itemWithImage:nil title:@"Focus Duration"];

    item1.kTitle = @"xxxxxx1";
    
    item1.pushVcClass = [UIViewController class];
    
    ZHYSwitchItem *item2 = [ZHYSwitchItem itemWithImage:nil title:@"Music Fusion"];
    
    ZHYGroups * groups = [ZHYGroups groupWithItems:@[item1,item2]];
    
    [self.kGroups addObject:groups];
}

@end
