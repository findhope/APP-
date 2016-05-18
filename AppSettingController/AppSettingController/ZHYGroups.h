//
//  ZHYGroups.h
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHYGroups : NSObject

/** 每个section内的Groups */
@property (strong, nonatomic) NSArray *kItems;
/** HeaderString */
@property (copy, nonatomic) NSString * kHeaderString;
/** FooterString */
@property (copy, nonatomic) NSString * kFooterString;

+ (instancetype)groupWithItems:(NSArray *)items;

@end
