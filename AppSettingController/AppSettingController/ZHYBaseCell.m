//
//  ZHYBaseCell.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYBaseCell.h"

static NSString * ID = @"ZHY_CELL";

@interface ZHYBaseCell ()

/** <##> */
@property (weak, nonatomic) UIImageView * arrowView;
/** <##> */
@property (weak, nonatomic) UISwitch * switchView;

@end

@implementation ZHYBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UIImageView *)arrowView{

    if (!_arrowView) {
        UIImageView * arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        
        arrow.frame = CGRectMake(0, 0, 20, 20);
        
        [self.contentView addSubview:arrow];
        _arrowView = arrow;
    }
    return _arrowView;
}

- (UISwitch *)switchView{

    if (!_switchView) {
        UISwitch * swith = [[UISwitch alloc] init];
        swith.onTintColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.4];
        [self.contentView addSubview:swith];
        _switchView = swith;
    }
    return _switchView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{

    ZHYBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        
        cell = [[ZHYBaseCell alloc] initWithStyle:style reuseIdentifier:ID];
        
        cell.textLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        cell.detailTextLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    }
    
    [cell setupCellBackground];
    return cell;
}

- (void)setupCellBackground{

    self.backgroundColor = [UIColor clearColor];
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(15, self.frame.size.height, [UIScreen mainScreen].bounds.size.width -30, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6];
    [self.contentView addSubview:lineView];
}

- (void)setItem:(ZHYBaseCellItem *)item{
    
    _item = item;
    
    [self setupData];
    
    [self setupAccessoryView];

}

- (void)setupData{
    
    if ([_item isKindOfClass:[ZHYBaseCellItem class]]) {
        self.textLabel.text = _item.kTitle;
        self.detailTextLabel.text = _item.kDetailTitle;
        self.imageView.image = _item.kImage;
    }else{
        
        self.textLabel.text = _item.kTitle;
    }
}

- (void)setupAccessoryView{
    
    if ([_item isKindOfClass:[ZHYArrowItem class]]) {
        
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([_item isKindOfClass:[ZHYSwitchItem class]]){
        
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }


}
@end
