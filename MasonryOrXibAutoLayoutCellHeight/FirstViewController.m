//
//  ViewController.m
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "FirstViewController.h"
#import "XibTableViewCell.h"
@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
static NSString * const ReuseIdentifier = @"XibTableViewCell";
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XibTableViewCell class]) bundle:nil] forCellReuseIdentifier:ReuseIdentifier];
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
