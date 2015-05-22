//
//  MainTopicView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MainTopicView.h"
#import "General.h"
#import "TopicModal.h"

static  const   CGFloat paddingVertical=10.0f;
static  const   CGFloat paddingHorizontal=15.0f;
static  const   CGFloat labelsMarginVertical=7.0f;

static  const   CGFloat topicLabelHeight=20.0f;
static  const   CGFloat detailLabelHeight=13.0f;

static const    CGFloat accessoryImageEdgeLength=24.0f;
static const    CGFloat accessoryImagePaddingVertical=18.0f;
static const    CGFloat accessoryImagePaddingRight=15.0f;

static NSString *accessoryImageName=@"testimg";
static const    CGFloat topicLabelFontSize=18.0f;
static const    CGFloat detailLabelFontSize=14.0f;

@implementation MainTopicView

-(instancetype)init{
    if(self=[super init]){
        [self createSubViews];
    }
    return self;
}


-(void)createSubViews{
    self.topicLabel=[[UILabel alloc]init];
    self.topicLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.topicLabel];
    [self.topicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(paddingVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal-accessoryImageEdgeLength);
        make.height.equalTo([NSNumber numberWithDouble:topicLabelHeight]);
    }];
    
    self.detailLabel=[[UILabel alloc]init];
    self.detailLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicLabel.mas_bottom).with.offset(labelsMarginVertical);
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal-accessoryImageEdgeLength);
        make.height.equalTo([NSNumber numberWithDouble:detailLabelHeight]);
    }];
    
    self.accessoryImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:accessoryImageName]];
    self.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.accessoryImage];
    [self.accessoryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(accessoryImagePaddingVertical);
        make.bottom.equalTo(self.mas_bottom).with.offset(-accessoryImagePaddingVertical);
        make.right.equalTo(self.mas_right).with.offset(-accessoryImagePaddingRight);
        make.width.equalTo([NSNumber numberWithDouble:accessoryImageEdgeLength]);
    }];
    
    
    [self.topicLabel setFont:[UIFont systemFontOfSize:topicLabelFontSize]];
    
    [self.detailLabel setFont:[UIFont systemFontOfSize:detailLabelFontSize]];
    
}





-(instancetype)initWithTopic:(NSString *)topic detail:(NSString *)detail{
    if(self=[self init]){
        [self setTopic:topic detail:detail];
    }
    return self;
}


-(void)setTopic:(NSString *)topic detail:(NSString *)detail{
    [self.topicLabel setText:topic];
    [self.detailLabel setText:detail];
}

-(void)setTopicViewWithTopicModal:(TopicModal *)modal{
    [self setTopic:modal.title detail:modal.detail];
}

+(CGFloat)height{
    return paddingVertical*2+labelsMarginVertical+topicLabelHeight+detailLabelHeight;
}

@end
