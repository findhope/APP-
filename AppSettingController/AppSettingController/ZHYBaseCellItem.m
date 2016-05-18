//
//  ZHYBaseCellItem.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYBaseCellItem.h"

@implementation ZHYBaseCellItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title{

    ZHYBaseCellItem *item = [[self alloc] init];
    item.kImage = image;
    item.kTitle = title;
    
    return item;
}

@end
