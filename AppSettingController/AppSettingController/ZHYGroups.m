//
//  ZHYGroups.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYGroups.h"

@implementation ZHYGroups


+ (instancetype)groupWithItems:(NSArray *)items{

    ZHYGroups * groupItems = [[ZHYGroups alloc] init];
    groupItems.kItems = items;
    return groupItems;
}
@end
