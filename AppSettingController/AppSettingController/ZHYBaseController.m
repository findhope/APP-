//
//  ZHYBaseController.m
//  AppSettingController
//
//  Created by MitnickKevin on 16/5/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYBaseController.h"


@interface ZHYBaseController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) UITableView *kTableView;

/** <##> */
@property (strong, nonatomic) NSIndexPath *lastIndexPath;

@end

@implementation ZHYBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewBackground];
    
    [self setupTableViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) tableViewStyle:UITableViewStyleGrouped];
    
}

- (void)setupViewBackground{
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)setupTableViewWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)style{

    UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [self.view addSubview:tableView];
    self.kTableView = tableView;
    self.kTableView.delegate = self;
    self.kTableView.dataSource = self;
    self.kTableView.rowHeight = 44;

}

- (NSMutableArray *)kGroups{

    if (!_kGroups) {
        _kGroups = [NSMutableArray array];
    }
    return _kGroups;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.kGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    ZHYGroups * groups = _kGroups[section];
    return groups.kItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZHYBaseCell * cell = [ZHYBaseCell cellWithTableView:tableView style:UITableViewCellStyleValue1];

    ZHYGroups * groups = self.kGroups[indexPath.section];
    
    ZHYBaseCellItem * item = groups.kItems[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self tableView:self.kTableView didDeselectRowAtIndexPath:self.lastIndexPath];
    
    self.lastIndexPath = indexPath;
    
    ZHYGroups *groups = self.kGroups[indexPath.section];
    ZHYArrowItem * item = groups.kItems[indexPath.row];
    
    if (item.optionBlock) {
        item.optionBlock(indexPath);
    }
    
    if ([item isKindOfClass:[ZHYArrowItem class]]) {
        if (item.pushVcClass) {
            UIViewController * vc = [[item.pushVcClass alloc] init];
            
            vc.view.backgroundColor = [UIColor purpleColor];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    ZHYBaseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        cell.selected = YES;
        if (cell.selected == YES) {
            UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected"]];
            img.frame = CGRectMake(0, 0, 20, 20);
            cell.accessoryView = img;
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZHYGroups *groups = self.kGroups[indexPath.section];
    
    ZHYBaseCellItem *item = groups.kItems[indexPath.row];
    
    ZHYBaseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.selected = NO;
    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        
        cell.accessoryView = nil;
        
    }
}
@end
