//
//  FlowerCollectionCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "FlowerCollectionCell.h"
#import "General.h"

static const CGFloat    imageEdgeLength=100.0f;
static const    CGFloat labelHeight=25.0f;

@implementation FlowerCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self viewCreate];
    }
    return self;
}


-(void)viewCreate{
    self.imageView=[[UIImageView alloc]init];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
    }];
    
    self.nameLabel=[[UILabel alloc]init];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
    
    self.flowerNumberLbel=[[UILabel alloc]init];
    [self.flowerNumberLbel setTextAlignment:NSTextAlignmentRight];
    self.flowerNumberLbel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.flowerNumberLbel];
    [self.flowerNumberLbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
}

#warning Unknow data struct.
-(void)setViewForModal:(PersonalFlowerModal *)modal{
    [self.imageView setImageWithURL:[NSURL URLWithString:modal.studentAvatar]];
    [self.nameLabel setText:modal.senderAppellation];
    [self.flowerNumberLbel setText:nil];
}

@end
