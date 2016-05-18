//
//  ZHYBaseCellItem.h
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZHYBaseCellItem : NSObject

/** cell左侧icon图片 */
@property (strong, nonatomic) UIImage *kImage;
/** 描述cell主Title */
@property (copy, nonatomic) NSString * kTitle;
/** 描述cellDetailTitle */
@property (copy, nonatomic) NSString * kDetailTitle;
/** 功能Block */
@property (copy, nonatomic) void(^optionBlock)(NSIndexPath *indexPath);

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
