//
//  CommonCollectionCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "CommonCollectionCell.h"
#import "General.h"

static const CGFloat imageEdgeLength=100.0f;
static const CGFloat labelHeight=20.0f;

@implementation CommonCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

-(void)createView{
    self.imageView=[[UIImageView alloc]init];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:imageEdgeLength]);
    }];
    
    
    self.textLabel=[[UILabel alloc]init];
    self.textLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:labelHeight]);
    }];
    
}

-(void)setViewImageWithURL:(NSString *)url text:(NSString *)text{
    [self.imageView setImageWithURL:[NSURL URLWithString:url]];
    [self.textLabel setText:text];
}


+(CGFloat)height{
    return imageEdgeLength+labelHeight;
}

+(CGFloat)width{
    return imageEdgeLength;
}

@end
