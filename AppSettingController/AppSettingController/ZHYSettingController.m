//
//  ZHYSettingController.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingController.h"
#import <Masonry.h>

@interface ZHYSettingController ()

@end

@implementation ZHYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton * closeButton = [[UIButton alloc] init];
    
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    
    [self.view addSubview:closeButton];
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.top.mas_equalTo(self.view).offset(64);
        make.left.mas_equalTo(self.view).offset(25);
    }];
    
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)closeButtonClick{

    [self dismissViewControllerAnimated:YES completion:^{
        
        //dismiss的回调
        
    }];
}
@end
