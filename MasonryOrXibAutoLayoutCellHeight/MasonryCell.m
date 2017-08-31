//
//  MasonryCell.m
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "MasonryCell.h"
#import <Masonry.h>

@interface MasonryCell ()
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *texttlabel;
@property (nonatomic,strong) UIButton *arrowBtn;
@end

@implementation MasonryCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    MasonryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasonryCell"];
    if (!cell) {
        cell = [[MasonryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MasonryCell"];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Snip20170823_1.png"]];
    [self.contentView addSubview:icon];
    self.icon = icon;
    
    UILabel *lab = [[UILabel alloc] init];
    [self.contentView addSubview:lab];
    lab.font = [UIFont systemFontOfSize:14];
    lab.numberOfLines = 0;
    self.texttlabel = lab;
    lab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAllLabel)];
    [self.texttlabel addGestureRecognizer:tap];
    
    UIButton *arrowDown = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:arrowDown];
    self.arrowBtn = arrowDown;
    [arrowDown addTarget:self action:@selector(showAllLabel) forControlEvents:UIControlEventTouchUpInside];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10); //top.and.leading
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    [self.texttlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(icon.mas_top);
        make.left.equalTo(icon.mas_right).offset(10);    //make.leading.equalTo(self.icon.mas_trailing).offset(10)
        make.right.mas_equalTo(-10);    // == make.right.equalTo(self).offset(-10);
        make.bottom.mas_equalTo(-30);   // == make.bottom.equalTo(self).offset(-30);
    }];
    [self.arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.texttlabel.mas_bottom);
        make.size.mas_equalTo(30);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    
    MASAttachKeys(icon,lab,arrowDown);
}

- (void)setModel:(CellModel *)model{
    _model = model;
    self.texttlabel.text = model.text;
    if (model.showAll) {
        [self.arrowBtn setImage:[UIImage imageNamed:@"ticket_arrow_up"] forState:UIControlStateNormal];
        [self.texttlabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.icon.mas_top);
            make.left.equalTo(self.icon.mas_right).offset(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-30);
            make.height.mas_greaterThanOrEqualTo(self.icon);
        }];
    } else {
        [self.arrowBtn setImage:[UIImage imageNamed:@"ticket_arrow_down"] forState:UIControlStateNormal];
        [self.texttlabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.icon.mas_height);
        }];
    }
}

- (void)showAllLabel{
    self.model.showAll = !self.model.showAll;
    !self.showAllBlock ?: self.showAllBlock();
}

@end

@implementation CellModel
@end
