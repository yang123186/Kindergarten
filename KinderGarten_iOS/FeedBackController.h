//
//  FeedBackController.h
//  KinderGarten_iOS
//
//  Created by 杨容清 on 15/6/4.
//  Copyright (c) 2015年 Rdd7. All rights reserved.
//
#import "FeedBackViewController.h"
#import <UIKit/UIKit.h>

@interface FeedBackController : UIViewController

@property (nonatomic, strong) FeedBackViewController *viewController;

-(instancetype) init;

-(void)getFeedBackMessage;

@end
