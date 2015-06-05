//
//  AttendanceCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceCell.h"
#import "General.h"

static const    CGFloat dateLabelHeight=30.0f;
static const    CGFloat cellCircleRadius=5.0f;

static  const   CGFloat padding=10.0f;

@implementation AttendanceCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:attendanceCellIdentifier]){
        [self createView];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(instancetype)initWithModal:(AttendanceIndex *)modal{
    if(self=[self init]){
        [self setViewForModal:modal];
    }
    return self;
}

-(void)createView{
    self.backgroundColor=CLEAR_COLOR;
    UIView *backView=[[UIView alloc]init];
    backView.layer.backgroundColor=WHITE_COLOR.CGColor;
    [backView setCircleRadius:cellCircleRadius];
    backView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(padding);
        make.right.equalTo(self.mas_right).with.offset(-padding);
        make.top.equalTo(self.mas_top).with.offset(padding/2);
        make.bottom.equalTo(self.mas_bottom).with.offset(-padding/2);
    }];
    
    self.dateLabel=[[UILabel alloc]init];
    self.dateLabel.backgroundColor=PINK_COLOR;
    [self.dateLabel setTextAlignment:NSTextAlignmentCenter];
    [self.dateLabel setTextColor:WHITE_COLOR];
    self.dateLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [backView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top);
        make.left.equalTo(backView.mas_left);
        make.right.equalTo(backView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:dateLabelHeight]);
    }];
    
    self.arriveLabel=[[ImageLabel alloc]init];
    [self.arriveLabel.imageView setImage:[UIImage imageNamed:@"arrive"]];
    self.arriveLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [backView addSubview:self.arriveLabel];
    [self.arriveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLabel.mas_bottom).with.offset(padding);
        make.centerX.equalTo(backView.mas_centerX);
        make.height.equalTo([NSNumber numberWithDouble:[ImageLabel height]]);
        make.width.equalTo(self.arriveLabel.mas_width);
    }];
    
    self.leaveLabel=[[ImageLabel alloc]init];
    [self.leaveLabel.imageView setImage:[UIImage imageNamed:@"left"]];
    self.leaveLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [backView addSubview:self.leaveLabel];
    [self.leaveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arriveLabel.mas_bottom).with.offset(padding);
        make.centerX.equalTo(backView.mas_centerX);
        make.height.equalTo([NSNumber numberWithDouble:[ImageLabel height]]);
        make.width.equalTo(self.leaveLabel.mas_width);
    }];
}


-(void)setViewForModal:(AttendanceIndex *)modal{
    [self.dateLabel setText:modal.datePreFix];
    if(modal.arriveTime){
        [self.arriveLabel.textLabel setText:modal.arriveTime];
    }
    else{
        [self.arriveLabel.textLabel setText:@"未知"];
    }
    if(modal.leaveTime){
        [self.leaveLabel.textLabel setText:modal.leaveTime];
    }
    else{
        [self.leaveLabel.textLabel setText:@"未知"];
    }

}


+(CGFloat)height{
    static CGFloat  cellHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cellHeight=padding*5+dateLabelHeight+2*[ImageLabel height];
    });
    return cellHeight;
}

@end
