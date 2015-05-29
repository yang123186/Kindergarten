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
//    LinkTypeURL,            //链接地址  eg: http://xx.com
    LinkTypePhoneNumber     //电话号码  eg: 13888888888
};

// 可用于识别的链接类型
typedef NS_OPTIONS(NSUInteger, RichLabelLinkDetectionTypes)
{
    LinkDetectionTypeUserURL  = (1 << 0),
//    LinkDetectionTypeURL         = (1 << 1),
    LinkDetectionTypePhoneNumber = (1 << 1),
    
    LinkDetectionTypeNone        = 0,
    LinkDetectionTypeAll         = NSUIntegerMax
};

typedef void (^LabelHandler)(RichLabelLinkType linkType, NSString *string, NSRange range);

@interface RichLabel : UILabel <NSLayoutManagerDelegate>

@property (nonatomic, strong) UIColor *linkColor;

@property (nonatomic, strong) UIColor *linkHighlightColor;

@property (nonatomic, strong) UIColor *linkBackgroundColor;

@property (nonatomic, assign) RichLabelLinkDetectionTypes linkDetectionTypes;

@property (nonatomic, copy) LabelHandler linkTapHandler;

@property (nonatomic, copy) LabelHandler linkLongPressHandler;



//Link scheme user://
-(void)appendUserWithName:(NSString*)name UserLink:(NSString*)link;

-(void)appendContent:(NSString*)content;

@end
