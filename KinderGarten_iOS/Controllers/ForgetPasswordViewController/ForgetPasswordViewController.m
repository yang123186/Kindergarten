//
//  ForgetPasswordViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "Masonry.h"
#import "LineTextView.h"
#import "LineLabel.h"
#import "ColorDefine.h"
#import "General.h"

#define PADDING_HORIZONTAL 15.0f

#define GROUP_TITLE_LABEL_TOP 0.0f
#define GROUP_TITLE_LABEL_LEFT 0.0f
#define GROUP_TITLE_LABEL_RIGHT 0.0f
#define GROUP_TITLE_LABEL_HEIGHT 40.0f

#define ACCOUNT_TEXT_TOP 0.0f
#define ACCOUNT_TEXT_LEFT 0.0f
#define ACCOUNT_TEXT_RIGHT 0.0f
#define ACCOUNT_TEXT_HEIGHT 40.0f

#define VERIFY_TEXT_TOP 0.0f
#define VERIFY_TEXT_LEFT 0.0f
#define VERIFY_TEXT_RIGHT 0.0f
#define VERIFY_TEXT_HEIGHT 40.0f

#define REQUEST_VERIFY_BUTTON_TOP 8.0f
#define REQUEST_VERIFY_BUTTON_RIGHT 9.0f
#define REQUEST_VERIFY_BUTTON_BOTTOM 8.0f
#define REQUEST_VERIFY_BUTTON_WIDTH 61.0f

#define COUNTING_LABEL_BUTTON_TOP 0.0f
#define COUNTING_LABEL_BUTTON_LEFT 0.0f
#define COUNTING_LABEL_BUTTON_RIGHT 0.0f
#define COUNTING_LABEL_BUTTON_HEIGHT 40.0f


static NSString *title=@"找回密码";
static NSString *groupTitleLabelText=@"通过手机找回密码";
static NSString *accountTextPlaceHolderText=@"手机号码";
static NSString *verifyCodeTextPlaceHolderText=@"验证码";
static NSString *requestVerifyCodeButtonTitle=@"立即获取";
static NSString *countLabelTextFormat=@"%li s后重新发送";

static const CGFloat requestVerifyCodeButtonTitleFontSize=14.0f;
static const CGFloat countingLabelFontSize=14.0f;

static const NSInteger defaultCountingTime=10;

@interface ForgetPasswordViewController()
@property (nonatomic,strong) LineLabel *groupTitleLabel;
@property (nonatomic,strong) LineTextView *accountText;
@property (nonatomic,strong) LineTextView *verifyCodeText;
@property (nonatomic,strong) UIButton *requestVerifyCodeButton;
@property (nonatomic,strong) LineLabel *countingLabel;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) NSInteger countTime;

@end



@implementation ForgetPasswordViewController

-(instancetype)init{
    self=[super init];
    return self;
}

-(void)viewDidLoad{
    self.title=title;
    self.view.layer.backgroundColor=BACKGROUND_GRAY.CGColor;
    
    UIView *superView=self.view;
    self.groupTitleLabel=[[LineLabel alloc]initWithInsets:UIEdgeInsetsMake(0.0f,PADDING_HORIZONTAL, 0.0f,PADDING_HORIZONTAL)];
    [self.groupTitleLabel setTextColor:PINK_COLOR];
    [self.groupTitleLabel setText:groupTitleLabelText];
    self.groupTitleLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.groupTitleLabel];
    [self.groupTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(GROUP_TITLE_LABEL_TOP);
        make.left.equalTo(superView.mas_left).with.offset(GROUP_TITLE_LABEL_LEFT);
        make.right.equalTo(superView.mas_right).with.offset(-GROUP_TITLE_LABEL_RIGHT);
        make.height.equalTo(@GROUP_TITLE_LABEL_HEIGHT);
    }];
    
    self.accountText=[[LineTextView alloc]initWithHorizontalPadding:PADDING_HORIZONTAL];
    self.accountText.placeholder=accountTextPlaceHolderText;
    self.accountText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.accountText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.accountText];
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupTitleLabel.mas_bottom).with.offset(ACCOUNT_TEXT_TOP);
        make.left.equalTo(superView.mas_left).with.offset(ACCOUNT_TEXT_LEFT);
        make.right.equalTo(superView.mas_right).with.offset(ACCOUNT_TEXT_RIGHT);
        make.height.equalTo(@ACCOUNT_TEXT_HEIGHT);
    }];
    
    self.verifyCodeText=[[LineTextView alloc]initWithHorizontalPadding:PADDING_HORIZONTAL];
    [self.verifyCodeText setRightPadding:REQUEST_VERIFY_BUTTON_WIDTH+REQUEST_VERIFY_BUTTON_RIGHT];
    self.verifyCodeText.placeholder=verifyCodeTextPlaceHolderText;
    self.verifyCodeText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.verifyCodeText.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.verifyCodeText];
    [self.verifyCodeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountText.mas_bottom).with.offset(VERIFY_TEXT_TOP);
        make.left.equalTo(superView.mas_left).with.offset(VERIFY_TEXT_LEFT);
        make.right.equalTo(superView.mas_right).with.offset(VERIFY_TEXT_RIGHT);
        make.height.equalTo(@VERIFY_TEXT_HEIGHT);
    }];
    
    self.requestVerifyCodeButton=[[UIButton alloc]init];
    self.requestVerifyCodeButton.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.requestVerifyCodeButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.requestVerifyCodeButton setTitle:requestVerifyCodeButtonTitle forState:UIControlStateNormal];
    [self.requestVerifyCodeButton.titleLabel setFont:[UIFont systemFontOfSize:requestVerifyCodeButtonTitleFontSize]];
    [self.requestVerifyCodeButton.layer setMasksToBounds:YES];
    [self.requestVerifyCodeButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.requestVerifyCodeButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.requestVerifyCodeButton addTarget:self action:@selector(requestVerifyCodeButtonDidTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.verifyCodeText addSubview:self.requestVerifyCodeButton];
    [self.requestVerifyCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifyCodeText.mas_top).with.offset(REQUEST_VERIFY_BUTTON_TOP);
        make.bottom.equalTo(self.verifyCodeText.mas_bottom).with.offset(-REQUEST_VERIFY_BUTTON_BOTTOM);
        make.right.equalTo(self.verifyCodeText.mas_right).with.offset(-REQUEST_VERIFY_BUTTON_RIGHT);
        make.width.equalTo(@REQUEST_VERIFY_BUTTON_WIDTH);
    }];
    
}

-(void)countingStart{
    if(!self.countingLabel){
        self.countingLabel=[[LineLabel alloc]initWithInsets:UIEdgeInsetsMake(0.0f, PADDING_HORIZONTAL, 0.0f, PADDING_HORIZONTAL)];
        [self.countingLabel setTextColor:PINK_COLOR];
        [self.countingLabel setFont:[UIFont systemFontOfSize:countingLabelFontSize]];
        self.countingLabel.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:self.countingLabel];
        [self.countingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.requestVerifyCodeButton.mas_bottom).with.offset(COUNTING_LABEL_BUTTON_TOP);
            make.left.equalTo(self.view.mas_left).with.offset(-COUNTING_LABEL_BUTTON_LEFT);
            make.right.equalTo(self.view.mas_right).with.offset(-COUNTING_LABEL_BUTTON_RIGHT);
            make.height.equalTo(@COUNTING_LABEL_BUTTON_HEIGHT);
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


-(void)requestVerifyCodeButtonDidTouched{
    if([self checkPhoneNumberLegal]){
#warning waiting for verifyCode rest api finish...
        /*TODO step:
         *1.request a verify code.
         *  -1.1 if request success,button .enable=no,startcounting
         *  -1.2 else tell user request fail,press button to try again.
         *2.sent phone number and verify code to server
         *  -2.1 if information is correct,push set new passowrd controller.
         *  -2.2 else tell user verify code wrong.
         */
    }
}


-(BOOL)checkPhoneNumberLegal{
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGULAR_EXPRESSION_MOBILE_PHONE];
    if(![regexMobile evaluateWithObject:self.accountText.text]){
        DLog(@"phone can't pass");
        return NO;
    }
    return YES;
}




@end
