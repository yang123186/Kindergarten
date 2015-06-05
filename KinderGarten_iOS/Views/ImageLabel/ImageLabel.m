//
//  ImageLabel.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ImageLabel.h"
#import "General.h"

static const    CGFloat textLabelMarginleft=10.0f;

static const    CGFloat imageEdgeLength=24.0f;

@implementation ImageLabel

-(instancetype)init{
    if(self=[super init]){
        [self createView];
    }
    return self;
}

-(void)createView{
    self.imageView=[[UIImageView alloc]init];
    [self addSubview:self.imageView];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
        make.width.equalTo(self.imageView.mas_height);
    }];
    
    self.textLabel=[[UILabel alloc]init];
    [self addSubview:self.textLabel];
    self.textLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.imageView.mas_right).with.offset(textLabelMarginleft);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
        make.right.equalTo(self.mas_right);
    }];
    
}


+(CGFloat)height{
    return imageEdgeLength;
}



@end
