//
//  FeedBackViewController.h
//  KinderGarten_iOS
//
//  Created by 杨容清 on 15/6/4.
//  Copyright (c) 2015年 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  FeedBackController;

@interface FeedBackViewController : NSObject

@property (nonatomic, strong) UITextView *feedBackView;
@property (nonatomic, strong) UILabel    *title;
@property   (nonatomic,strong)  UIBarButtonItem *OKbutton;


@property (nonatomic, weak) FeedBackController *rootController;
@property (nonatomic, weak) UIView             *view;

-(instancetype) initWithRootController:(FeedBackController*) rootController;

@end
