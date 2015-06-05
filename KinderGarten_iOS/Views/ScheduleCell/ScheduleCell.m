//
//  ScheduleCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ScheduleCell.h"
#import "General.h"

static const double mutiplyWidthCoefficient=0.4;

static const CGFloat cellHeight=60.0f;

@implementation ScheduleCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scheduleCellIdentifier]){
        [self createView];
    }
    return self;
}

-(void)createView{
    self.timeLabel=[[UILabel alloc]init];
    self.timeLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.width.equalTo(self.contentView.mas_width).with.multipliedBy(mutiplyWidthCoefficient);
    }];
    
    self.classLabel=[[UILabel alloc]init];
    self.classLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.classLabel];
    [self.classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.timeLabel.mas_right);
        make.right.equalTo(self.contentView.mas_right);
    }];
    
}

-(void)setView{
    
}

+(CGFloat)height{
    return cellHeight;
}

@end
