//
//  BaseViewController.m
//  XibAndMasonryTest
//
//  Created by GoGo: 林祥星 on 2017/8/23.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度
@end

NSString const *textstring = @"长文本性能问题 如果label需要展示长文本，则label的宽度要固定，而不能使用lessThanOrEqualTo之类不确定约束，否则会有严重的滚动时卡顿。\niOS7上指定View宽度为屏幕宽度而未设置leading时，View会中心居左展示，则仅能够显示View的一半 \nCell重用过程中的约束冲突问题 \nCell重用时，高度未更新，而数据发生改变后，在高度不足的情况下，会抛高度相关的约束冲突异常。对于这种情况需要在prepareForReuse中uninstall造成冲突的约束，在设置View的时候再install.";

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    return height ? height.floatValue : 100;
 }
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
    //控制cell下划线铺满屏幕宽:最好是在这里做,也可以在此代理willDisplayCell:前一步cellForRowAtIndexPath:返回 cell 之前做
    [cell setSeparatorInset:UIEdgeInsetsZero];
}

#pragma mark - Getters
- (NSMutableDictionary *)heightAtIndexPath{
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
