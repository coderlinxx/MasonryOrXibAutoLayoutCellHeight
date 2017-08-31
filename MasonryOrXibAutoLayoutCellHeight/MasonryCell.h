//
//  MasonryCell.h
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellModel;
@interface MasonryCell : UITableViewCell
@property (nonatomic,copy) void(^showAllBlock)();
@property (nonatomic,copy) CellModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

@interface CellModel : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) BOOL showAll;
@end
