//
//  ZHYBaseCell.h
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHYBaseCellItem.h"
#import "ZHYArrowItem.h"
#import "ZHYSwitchItem.h"

@interface ZHYBaseCell : UITableViewCell

@property (strong, nonatomic) ZHYBaseCellItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
