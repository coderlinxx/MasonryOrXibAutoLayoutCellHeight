//
//  SecondViewController.m
//  XibAndMasonryTest
//
//  Created by GoGo: 林祥星 on 2017/8/23.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "SecondViewController.h"
#import "MasonryCell.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MasonryCell *cell = [MasonryCell cellWithTableView:tableView];
    [cell setModel:self.dataArray[indexPath.row]];
    [cell setShowAllBlock:^{
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Getters
- (NSMutableArray *)dataArray{
    
    if (!_dataArray){
        _dataArray = [NSMutableArray array];        
        for (int i = 0; i < 1000; i++){
            CellModel *model = [[CellModel alloc] init];
            NSInteger index = (arc4random()%(textstring.length / 20)) * 20;
            model.text = [textstring substringToIndex:MAX(20, index)];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
