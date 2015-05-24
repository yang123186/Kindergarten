//
//  ForgetViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ForgetViewController.h"
#import "ForgetPasswordViewController.h"
#import "General.h"

/*========================================================================*/

static  const   CGFloat paddingHorizontal=15.0f;

static  const   CGFloat titleLabelHeight=40.0f;
static  const   CGFloat textLineHeight=40.0f;
static  const   CGFloat countingLabelHeight=40.0f;


static  const   CGFloat requestVerifyButtonTop=8.0f;
static  const   CGFloat requestVerifyButtonRight=9.0f;
static  const   CGFloat requestVerifyButtonBottom=8.0f;
static  const   CGFloat requestVerifyButtonWidth=61.0f;

static const    CGFloat titleLabelTopMargin=20.0f;
static const    CGFloat commitButtonMargin=30.0f;
static const    CGFloat commitButtonPaddingHorizontal=20.0f;

static NSString *title=@"找回密码";
static NSString *groupTitleLabelText=@"通过手机找回密码";
static NSString *titleTitleLabelText=@"设置新密码";
static NSString *accountTextPlaceHolderText=@"手机号码";
static NSString *verifyCodeTextPlaceHolderText=@"验证码";
static NSString *requestVerifyCodeButtonTitle=@"立即获取";
static NSString *countLabelTextFormat=@"%li s后重新发送";
static NSString *commitButtonText=@"提交";
static NSString *freshPasswordText=@"新密码";
static NSString *repeatNewPassword=@"重复新密码";

static const CGFloat requestVerifyCodeButtonTitleFontSize=14.0f;
static const CGFloat countingLabelFontSize=14.0f;

static const NSInteger defaultCountingTime=10;

/*========================================================================*/




@implementation ForgetViewController

-(instancetype)initWithRootController:(ForgetPasswordViewController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    self.controller.title=title;
    self.view.layer.backgroundColor=BACKGROUND_GRAY.CGColor;
    
    UIView *superView=self.view;
    self.groupTitleLabel=[[LineLabel alloc]initWithInsets:UIEdgeInsetsMake(0.0f,paddingHorizontal, 0.0f,paddingHorizontal)];
    [self.groupTitleLabel setTextColor:PINK_COLOR];
    [self.groupTitleLabel setText:groupTitleLabelText];
    self.groupTitleLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.groupTitleLabel];
    [self.groupTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:titleLabelHeight]);
    }];
    
    self.accountText=[[LineTextView alloc]initWithHorizontalPadding:paddingHorizontal];
    self.accountText.placeholder=accountTextPlaceHolderText;
    self.accountText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.accountText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.accountText];
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupTitleLabel.mas_bottom);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    
    self.lineView=[[UIView alloc]init];
    self.lineView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.lineView];
    self.lineView.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountText.mas_bottom);
        make.height.equalTo(@0.3);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.verifyCodeText=[[LineTextView alloc]initWithHorizontalPadding:paddingHorizontal];
    [self.verifyCodeText setRightPadding:requestVerifyButtonWidth+requestVerifyButtonRight];
    self.verifyCodeText.placeholder=verifyCodeTextPlaceHolderText;
    self.verifyCodeText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.verifyCodeText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.verifyCodeText];
    [self.verifyCodeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    
    self.requestVerifyCodeButton=[[UIButton alloc]init];
    self.requestVerifyCodeButton.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.requestVerifyCodeButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.requestVerifyCodeButton setTitle:requestVerifyCodeButtonTitle forState:UIControlStateNormal];
    [self.requestVerifyCodeButton.titleLabel setFont:[UIFont systemFontOfSize:requestVerifyCodeButtonTitleFontSize]];
    [self.requestVerifyCodeButton.layer setMasksToBounds:YES];
    [self.requestVerifyCodeButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.requestVerifyCodeButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.requestVerifyCodeButton addTarget:self.controller action:@selector(requestVerifyCodeButtonDidTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.verifyCodeText addSubview:self.requestVerifyCodeButton];
    [self.requestVerifyCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifyCodeText.mas_top).with.offset(requestVerifyButtonTop);
        make.bottom.equalTo(self.verifyCodeText.mas_bottom).with.offset(-requestVerifyButtonBottom);
        make.right.equalTo(self.verifyCodeText.mas_right).with.offset(-requestVerifyButtonRight);
        make.width.equalTo([NSNumber numberWithDouble:requestVerifyButtonWidth]);
    }];
    
    self.titleLabel=[[LineLabel alloc]initWithInsets:UIEdgeInsetsMake(0.0f,paddingHorizontal, 0.0f,paddingHorizontal)];
    [self.titleLabel setTextColor:PINK_COLOR];
    [self.titleLabel setText:titleTitleLabelText];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifyCodeText.mas_bottom).with.offset(countingLabelHeight+titleLabelTopMargin);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    
    self.freshPasswordText=[[LineTextView alloc]initWithHorizontalPadding:paddingHorizontal];
    self.freshPasswordText.placeholder=accountTextPlaceHolderText;
    self.freshPasswordText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.freshPasswordText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.freshPasswordText];
    [self.freshPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    
    
    self.repeatNewPasswordText=[[LineTextView alloc]initWithHorizontalPadding:paddingHorizontal];
    self.repeatNewPasswordText.placeholder=accountTextPlaceHolderText;
    self.repeatNewPasswordText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.repeatNewPasswordText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.repeatNewPasswordText];
    [self.repeatNewPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freshPasswordText.mas_bottom);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    
    self.commitButton=[[UIButton alloc]init];
    self.commitButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.commitButton];
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.repeatNewPasswordText.mas_bottom).with.offset(commitButtonMargin);
        make.left.equalTo(superView.mas_left).with.offset(commitButtonPaddingHorizontal);
        make.right.equalTo(superView.mas_right).with.offset(-commitButtonPaddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:textLineHeight]);
    }];
    self.commitButton.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.commitButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.commitButton setTitle:commitButtonText forState:UIControlStateNormal];
    [self.commitButton addTarget:self.controller action:@selector(commitPasswordInfo) forControlEvents:UIControlEventTouchUpInside];

}



-(void)countingStart{
    if(!self.countingLabel){
        self.countingLabel=[[LineLabel alloc]initWithInsets:UIEdgeInsetsMake(0.0f, paddingHorizontal, 0.0f, paddingHorizontal)];
        [self.countingLabel setTextColor:PINK_COLOR];
        [self.countingLabel setFont:[UIFont systemFontOfSize:countingLabelFontSize]];
        self.countingLabel.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:self.countingLabel];
        [self.countingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.requestVerifyCodeButton.mas_bottom);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.height.equalTo([NSNumber numberWithDouble:countingLabelHeight]);
        }];
        
        self.countTime=defaultCountingTime;
        self.timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countingTime) userInfo:nil repeats:YES];
        
    }
}

-(void)countingTime{
    if(self.countTime>0){
        --self.countTime;
        [self.countingLabel setText:[NSString stringWithFormat:countLabelTextFormat,(long)self.countTime]];
    }
    else{
        [self.timer invalidate];
        [self.requestVerifyCodeButton setEnabled:YES];
    }
}


@end
