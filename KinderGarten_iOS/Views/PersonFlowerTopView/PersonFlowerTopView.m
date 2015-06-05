//
//  PersonFlowerTopView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonFlowerTopView.h"
#import "General.h"

static const    CGFloat iconEdgeLength=50.0f;
static const    CGFloat iconPaddingTop=40.0f;
static const    CGFloat sendFlowerButtonWidth=80.0f;
static const    CGFloat sendFlowerButtonHeight=25.0f;
static const    CGFloat sendFlowerButtonPaddingRight=15.0f;
static const    CGFloat sendFlowerButtonPaddingBottom=10.0f;


static const    CGFloat flowerNumberLabelHeight=25.0f;
static const    CGFloat flowerNumberLabelWidth=32.0f;
static const    CGFloat flowerNumberLabelPaddingLeft=16.0f;
static const    CGFloat flowerNumberLabelPaddingBottom=15.0f;


@implementation PersonFlowerTopView

-(instancetype)init{
    if (self=[super init]) {
        [self createViews];
    }
    return self;
}


-(void)createViews{
    self.icon=[[UIImageView alloc]init];
    [self.icon setCircleRadius:iconEdgeLength/2];
    self.icon.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(iconPaddingTop);
        make.width.equalTo([NSNumber numberWithDouble:iconEdgeLength]);
        make.height.equalTo(self.icon.mas_width);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    self.sendFlowerButton=[[UIButton alloc]init];
    [self.sendFlowerButton setBackgroundColor:PINK_COLOR];
    [self.sendFlowerButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    self.sendFlowerButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.sendFlowerButton];
    [self.sendFlowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithDouble:sendFlowerButtonWidth]);
        make.height.equalTo([NSNumber numberWithDouble:sendFlowerButtonHeight]);
        make.right.equalTo(self.mas_right).with.offset(-sendFlowerButtonPaddingRight);
        make.bottom.equalTo(self.mas_bottom).with.offset(-sendFlowerButtonPaddingBottom);
    }];
    
    
    self.flowerNumberLabel=[[UILabel alloc]init];
    self.flowerNumberLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.flowerNumberLabel];
    [self.flowerNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithDouble:flowerNumberLabelWidth]);
        make.height.equalTo([NSNumber numberWithDouble:flowerNumberLabelHeight]);
        make.left.equalTo(self.mas_left).with.offset(flowerNumberLabelPaddingLeft);
        make.bottom.equalTo(self.mas_bottom).with.offset(-flowerNumberLabelPaddingBottom);
    }];
    
    
}

@end
