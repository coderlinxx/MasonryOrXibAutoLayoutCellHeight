//
//  XibTableViewCell.m
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "XibTableViewCell.h"

@interface XibTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *texttLabel;
@end
static UILabel *tableViewCellDetailLabel = nil;
@implementation XibTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    tableViewCellDetailLabel = _texttLabel;
}

- (void)setModel:(XibCellModel *)model{
    _model = model;
    _texttLabel.text = model.text;
}

+ (CGFloat)cellHeightWithModel:(XibCellModel *)model{
    CGSize size = [model.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tableViewCellDetailLabel.font} context:nil].size;
    return 100 + size.height;
}

@end

@implementation XibCellModel
@end
