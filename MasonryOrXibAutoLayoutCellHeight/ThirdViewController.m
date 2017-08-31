//
//  ThirdViewController.m
//  XibAndMasonryTest
//
//  Created by GoGo: 林祥星 on 2017/8/29.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "ThirdViewController.h"
#import "XibTableViewCell.h"
#import "BaseViewController.h"

@interface ThirdViewController ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *selectedIndexPathes;//所有选中 cell 的IndexPath
@end

static NSString * const ReuseIdentifier = @"XibTableViewCell";

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectedIndexPathes = [NSMutableDictionary dictionary];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XibTableViewCell class]) bundle:nil] forCellReuseIdentifier:ReuseIdentifier];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XibTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    XibCellModel *model = self.dataArray[indexPath.row];
    return [self cellIsSelected:indexPath] ? [XibTableViewCell cellHeightWithModel:model] : 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //控制cell下划线铺满屏幕宽:最好是在这里做,也可以在此代理willDisplayCell:前一步cellForRowAtIndexPath:返回 cell 之前做
    [cell setSeparatorInset:UIEdgeInsetsZero];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    BOOL isSelected = ![self cellIsSelected:indexPath];
    NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
    [_selectedIndexPathes setObject:selectedIndex forKey:indexPath];

    [tableView beginUpdates];
    [tableView endUpdates];
}

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
    NSNumber *selectedIndex = [_selectedIndexPathes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}



#pragma mark - Getters
- (NSMutableArray *)dataArray{
    
    if (!_dataArray){
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 3000; i++){
            XibCellModel *model = [[XibCellModel alloc] init];
            NSInteger index = (arc4random()%(textstring.length / 20)) * 20;
            model.text = [textstring substringToIndex:MAX(20, index)];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
