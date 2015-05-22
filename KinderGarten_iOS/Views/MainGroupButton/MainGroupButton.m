//
//  MainGroupButton.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MainGroupButton.h"
#import "General.h"

static const    CGFloat spacePadding=9.0f;
static const    CGFloat titleHeight=14.0f;

static const    CGFloat titleFontSize=14.0f;

@implementation MainGroupButton

-(instancetype)init{
    if(self=[super init]){
        self.picture=[[UIImageView alloc]init];
        self.title=[[UILabel alloc]init];
        self.userInteractionEnabled=YES;
        [self subviewsInitialize];
    }
    return self;
}


-(instancetype)initWithImage:(UIImage *)image title:(NSString *)title{
    if(self=[self init]){
        [self setImage:image title:title];
    }
    return self;
}



-(void)subviewsInitialize{
    self.picture.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.picture];
    [self.picture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:pictureLength]);
    }];
    
    self.title.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picture.mas_bottom).with.offset(spacePadding);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:titleHeight]);
    }];
    
    [self.picture setCircleRadius:pictureLength/2];
    self.picture.contentMode=UIViewContentModeScaleToFill;
    
    
    [self.title setFont:[UIFont systemFontOfSize:titleFontSize]];
    [self.title setTextAlignment:NSTextAlignmentCenter];
}


-(void)setImage:(UIImage *)image title:(NSString *)title{
    if(image){
        [self.picture setImage:image];
    }
    if(title){
        [self.title setText:title];
    }
}


+(CGFloat)requireHieght{
    return pictureLength+spacePadding+titleHeight;
}

+(CGFloat)requireWidth{
    return pictureLength;
}

@end
