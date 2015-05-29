//
//  FlowerProgressCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "FlowerProgressCell.h"
#import "General.h"

static const CGFloat labelPaddingTop=10.0f;
static const CGFloat labelPaddingHorizontal=10.0f;
static const CGFloat labelHeight=20.0f;

static const CGFloat progressViewMarginVertical=12.0f;

static CGFloat FlowerProgressCellHeight=59.0f;

@implementation FlowerProgressCell

-(instancetype)init{
    if (self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flowerProgressCellIdentifier]) {
        [self createView];
    }
    return self;
}

-(void)createView{
    UIView *contentView=self.contentView;
    
    self.flowerNameLabel=[[UILabel alloc]init];
    self.flowerNameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [contentView addSubview:self.flowerNameLabel];
    [self.flowerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top).with.offset(labelPaddingTop);
        make.left.equalTo(contentView.mas_left).with.offset(labelPaddingHorizontal);
        make.right.equalTo(contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
    self.flowerNumberLabel=[[UILabel alloc]init];
    [self.flowerNumberLabel setTextAlignment:NSTextAlignmentRight];
    self.flowerNumberLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [contentView addSubview:self.flowerNumberLabel];
    [self.flowerNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.flowerNameLabel.mas_top);
        make.left.equalTo(contentView.mas_left);
        make.right.equalTo(contentView.mas_right).with.offset(-labelPaddingHorizontal);
        make.height.equalTo(self.flowerNameLabel.mas_height);
    }];
    
    self.progressView=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progressView setProgressTintColor:PINK_COLOR];
    self.progressView.translatesAutoresizingMaskIntoConstraints=NO;
    [contentView addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.flowerNameLabel.mas_bottom).with.offset(progressViewMarginVertical);
        make.left.equalTo(self.flowerNameLabel.mas_left);
        make.right.equalTo(self.flowerNumberLabel.mas_right);
        make.bottom.equalTo(contentView.mas_bottom).with.offset(-progressViewMarginVertical);
    }];

    
    /*test*/
    self.flowerNumberLabel.text=@"200";
    self.flowerNameLabel.text=@"爱吃饭";
    self.progressView.progress=0.7;
}


+(CGFloat)height{
    return FlowerProgressCellHeight;
}

@end
