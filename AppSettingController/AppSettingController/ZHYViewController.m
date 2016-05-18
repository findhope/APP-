//
//  ZHYViewController.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYViewController.h"
#import <Masonry.h>
#import "ZHYNavController.h"
#import "ZHYSettingController.h"

@interface ZHYViewController ()

@end

@implementation ZHYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton * menuButton = [[UIButton alloc] init];
    
    [self.view addSubview:menuButton];
    
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    
    [menuButton addTarget:self action:@selector(menuButtonClick) forControlEvents:UIControlEventTouchUpInside];

    [menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(26, 26));
        
        make.left.mas_equalTo(self.view).offset(25);
        
        make.top.mas_equalTo(self.view).offset(64);
        
    }];
    
}

- (void)menuButtonClick{

    ZHYSettingController * settingVc = [[ZHYSettingController alloc] init];
    
    ZHYNavController * navVc = [[ZHYNavController alloc] initWithRootViewController:settingVc];

    [self presentViewController:navVc animated:YES completion:^{
        //弹出控制器回调
    }];

}
@end
