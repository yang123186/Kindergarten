//
//  RichLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "NSAttributedString+Emotion.h"


// 链接类型
typedef NS_ENUM(NSInteger, RichLabelLinkType)
{
    LinkTypeUserURL,     //用户昵称  eg: @abcd
    LinkTypePhoneNumber     //电话号码  eg: 13888888888
};


typedef void (^LabelHandler)(RichLabelLinkType linkType, NSString *string, NSRange range);

@interface RichLabel : UILabel <NSLayoutManagerDelegate>


@property (nonatomic, copy) LabelHandler linkTapHandler;


- (instancetype)initWithWidth:(CGFloat)width;
//Link scheme user://
-(void)appendUserWithName:(NSString*)name UserLink:(NSString*)link;

-(void)appendContent:(NSString*)content;

-(CGFloat)height;

@end
