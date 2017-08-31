//
//  HomeViewController.m
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface HomeViewController ()
@property (nonatomic,strong) NSDictionary *dataDictionary;
@end

static NSString *cellId = @"HomeViewControllerCell";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动态布局cell高度";
    //：UIStoryboard里获取该控制器的Identifier并赋给单独控制器
//    ViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    self.dataDictionary = [NSDictionary dictionaryWithObjects:@[
                                                                @[@"预加载高度+缓存高度+autoLayout自动布局",
                                                                  @"预加载高度+缓存高度+masonry布局",
                                                                  @"手动计算高度+缓存高度+原生布局,"],
                                                                @[[FirstViewController new],
                                                                  [SecondViewController new],
                                                                  [ThirdViewController new],],
                                                                @[@"FirstViewController",
                                                                  @"SecondViewController",
                                                                  @"ThirdViewController",]
                                                                ] forKeys:@[@"title",@"controller",@"controllerTitle"]];
    self.tableView.tableFooterView = [UIView new];

}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.dataDictionary objectForKey:@"controllerTitle"][indexPath.row];
    cell.detailTextLabel.text = [self.dataDictionary objectForKey:@"title"][indexPath.row];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = [self.dataDictionary objectForKey:@"controller"][indexPath.row];
    controller.title = [self.dataDictionary objectForKey:@"controllerTitle"][indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
