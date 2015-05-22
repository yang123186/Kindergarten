//
//  ModifyPasswordViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ModifyPasswordViewController.h"
#import "ModifyPasswordController.h"
#import "General.h"

static NSString *oldPasswordPlaceHolder=@"原始密码";
static NSString *freshPasswordPlaceHolder=@"新密码";
static NSString *repeatPasswordPlaceHolder=@"确认新密码";

static  const   CGFloat marginVertical=20.0f;
static  const   CGFloat textHeight=40.0f;
static  const   CGFloat textPaddingHorizontal=20.0f;

static NSString *OKbuttonImageName=@"nav_OK";

@implementation ModifyPasswordViewController

-(instancetype)initWithRootController:(ModifyPasswordController *)rootController{
    if(self=[super init]){
        self.rootController=rootController;
        self.view=rootController.view;
        [self createSubViews];
    }
    return self;
}


-(void)createSubViews{
    [self.view setBackgroundColor:BACKGROUND_GRAY];
    
    self.oldPasswordText=[[UITextField alloc]init];
    self.oldPasswordText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.oldPasswordText];
    [self.oldPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(marginVertical);
        make.height.equalTo([NSNumber numberWithDouble:textHeight]);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.freshPasswordText=[[UITextField alloc]init];
    self.freshPasswordText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.freshPasswordText];
    [self.freshPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldPasswordText.mas_bottom).with.offset(marginVertical);
        make.height.equalTo([NSNumber numberWithDouble:textHeight]);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.repeatPasswordText=[[UITextField alloc]init];
    self.repeatPasswordText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.repeatPasswordText];
    [self.repeatPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freshPasswordText.mas_bottom).with.offset(1.0f);
        make.height.equalTo([NSNumber numberWithDouble:textHeight]);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    
    
    self.OKbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:OKbuttonImageName] style:UIBarButtonItemStylePlain target:self.rootController action:@selector(commitNewPassword)];
    [self.rootController.navigationItem setRightBarButtonItem:self.OKbutton];
    
    [self.oldPasswordText setSecureTextEntry:YES];
    [self.oldPasswordText setBackgroundColor:WHITE_COLOR];
    [self.oldPasswordText setHorizontalPadding:textPaddingHorizontal];
    [self.oldPasswordText setPlaceholder:oldPasswordPlaceHolder];
    
    [self.freshPasswordText setSecureTextEntry:YES];
    [self.freshPasswordText setBackgroundColor:WHITE_COLOR];
    [self.freshPasswordText setHorizontalPadding:textPaddingHorizontal];
    [self.freshPasswordText setPlaceholder:freshPasswordPlaceHolder];
    
    [self.repeatPasswordText setSecureTextEntry:YES];
    [self.repeatPasswordText setBackgroundColor:WHITE_COLOR];
    [self.repeatPasswordText setHorizontalPadding:textPaddingHorizontal];
    [self.repeatPasswordText setPlaceholder:repeatPasswordPlaceHolder];
    
}

@end
