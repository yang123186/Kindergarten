//
//  FlowerCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "FlowerCell.h"
#import "General.h"

static const CGFloat    paddingVertical=10.0f;
static const CGFloat    paddingHorizontal=15.0f;


static const    CGFloat labelHeight=30.0f;
static const    CGFloat imageEdgeLength=100.0f;

@implementation FlowerCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FlowerCellIdentifier]){
        [self viewCreate];
    }
    return self;
}

-(void)viewCreate{
    self.nameLabel=[[UILabel alloc]init];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(paddingVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
    self.timeLabel=[[UILabel alloc]init];
    [self.timeLabel setTextAlignment:NSTextAlignmentRight];
    self.timeLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(paddingVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
    
    self.flowerNameLabel=[[UILabel alloc]init];
    self.flowerNameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.flowerNameLabel];
    [self.flowerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(paddingVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
    self.childImageView=[[UIImageView alloc]init];
    self.childImageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.childImageView];
    [self.childImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.flowerNameLabel.mas_bottom).with.offset(paddingVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.width.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
    }];
    
    
    self.flowerImageView=[[UIImageView alloc]init];
    self.flowerImageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.flowerImageView];
    [self.flowerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.flowerNameLabel.mas_bottom).with.offset(paddingVertical);
        make.left.equalTo(self.childImageView.mas_right).with.offset(paddingHorizontal);
        make.width.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
    }];
}


-(void)setViewForModal:(PersonalFlowerModal *)modal{
    [self.nameLabel setText:modal.senderAppellation];
    [self.childImageView setImageWithURL:[NSURL URLWithString:modal.studentAvatar]];
    [self.flowerImageView setImageWithURL:[NSURL URLWithString:modal.cFlowers.icon]];
    [self.flowerNameLabel setText:modal.cFlowers.name];
    [self.timeLabel setText:modal.time];
    
}

+(CGFloat)height{
    return 4*paddingVertical+labelHeight*2+imageEdgeLength;
}

@end
