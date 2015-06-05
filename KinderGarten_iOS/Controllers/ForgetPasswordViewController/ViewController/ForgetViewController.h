//
//  ForgetViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LineTextView.h"
#import "LineLabel.h"

@class ForgetPasswordViewController;
@interface ForgetViewController : NSObject

@property   (nonatomic,weak)  ForgetPasswordViewController   *controller;
@property   (nonatomic,weak)  UIView                         *view;


@property (nonatomic,strong) LineLabel *groupTitleLabel;
@property (nonatomic,strong) LineTextView *accountText;
@property (nonatomic,strong) LineTextView *verifyCodeText;
@property (nonatomic,strong) UIButton *requestVerifyCodeButton;
@property (nonatomic,strong) LineLabel *countingLabel;

@property (nonatomic,strong) LineLabel *titleLabel;
@property (nonatomic,strong) LineTextView *freshPasswordText;
@property (nonatomic,strong) LineTextView *repeatNewPasswordText;
@property (nonatomic,strong) UIButton *commitButton;


@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) NSInteger countTime;



-(instancetype)initWithRootController:(ForgetPasswordViewController*)controller;

@end
