//
//  LoginController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "LoginController.h"
#import "MainController.h"
#import "Masonry.h"
#import "NetWorking.h"
#import "ColorDefine.h"
#import "General.h"
#import "MBProgressHUD.h"

#import "LineTextView.h"
#import "ForgetPasswordViewController.h"

/*________________________________________________________*/
#pragma mark ViewsSetting

#define TEXT_HEIGHT 40.0f
#define TEXT_PADDING_TOP    160.0f
#define TEXT_PADDING_LEFT   0.0f
#define TEXT_PADDING_RIGHT 0.0f
#define TEXT_INSET_PADDING_HORIZONTAL   15.0f

#define LOGIN_BUTTON_TOP_DISTANCE   40.0f
#define LOGIN_BUTTON_PADDING_HORIZONTAL   15.0f
#define LOGIN_BUTTON_HEIGHT 40.0f

#define FORGET_BUTTON_PADDING_RIGHT     15.0f
#define FORGET_BUTTON_PADDING_BOTTOM    20.0f
/*________________________________________________________*/

static NSString *loginTypeKey=@"loginType";
static NSString *accountKey=@"phone";
static NSString *passwordKey=@"password";

static NSString *authenticatedFailString=@"用户名或密码错误";
static NSString *badRequestString=@"请求格式错误";

static NSString *accountPlaceHolder=@"请输入手机号";
static NSString *passwordPlaceHolder=@"请输入密码";

static NSString *title=@"登录";
/*________________________________________________________*/

#pragma mark PrivateProperties
@interface LoginController()

@property   (nonatomic,strong)    LineTextView *accountText;
@property   (nonatomic,strong)    LineTextView *passwordText;
@property   (nonatomic,strong)    UIButton    *loginButton;
@property   (nonatomic,strong)    UIButton    *forgetPasswordButton;
@property   (nonatomic,strong)    UIView      *lineView;

@end





@implementation LoginController


-(instancetype)init{
    if(self=[super init]){
        
    }
    
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=title;
    self.view.layer.backgroundColor=BACKGROUND_GRAY.CGColor;
    UIView *superView=self.view;
    
    self.accountText=[[LineTextView alloc]init];
    self.accountText.translatesAutoresizingMaskIntoConstraints=NO;
    self.accountText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.accountText.placeholder=accountPlaceHolder;
    [self.accountText setHorizontalPadding:TEXT_INSET_PADDING_HORIZONTAL];
    [self.view addSubview:self.accountText];
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(TEXT_PADDING_TOP);
        make.left.equalTo(superView.mas_left).with.offset(TEXT_PADDING_LEFT);
        make.right.equalTo(superView.mas_right).with.offset(-TEXT_PADDING_RIGHT);
        make.height.equalTo(@TEXT_HEIGHT);
    }];
    
    self.lineView=[[UIView alloc]init];
    self.lineView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.lineView];
    self.lineView.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountText.mas_bottom);
        make.height.equalTo(@0.25);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.passwordText=[[LineTextView alloc]init];
    self.passwordText.translatesAutoresizingMaskIntoConstraints=NO;
    self.passwordText.layer.backgroundColor=WHITE_COLOR.CGColor;
    self.passwordText.placeholder=passwordPlaceHolder;
    [self.passwordText setHorizontalPadding:TEXT_INSET_PADDING_HORIZONTAL];
    [self.passwordText setSecureTextEntry:YES];
    [self.view addSubview:self.passwordText];
    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.equalTo(superView.mas_left).with.offset(TEXT_PADDING_LEFT);
        make.right.equalTo(superView.mas_right).with.offset(-TEXT_PADDING_RIGHT);
        make.height.equalTo(@TEXT_HEIGHT);
    }];
    
    self.loginButton=[[UIButton alloc]init];
    self.loginButton.translatesAutoresizingMaskIntoConstraints=NO;
    self.loginButton.layer.backgroundColor=PINK_COLOR.CGColor;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.loginButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordText.mas_bottom).with.offset(LOGIN_BUTTON_TOP_DISTANCE);
        make.left.equalTo(superView.mas_left).with.offset(LOGIN_BUTTON_PADDING_HORIZONTAL);
        make.right.equalTo(superView.mas_right).with.offset(-LOGIN_BUTTON_PADDING_HORIZONTAL);
        make.height.equalTo(@LOGIN_BUTTON_HEIGHT);
    }];
    
    self.forgetPasswordButton=[[UIButton alloc]init];
    self.forgetPasswordButton.translatesAutoresizingMaskIntoConstraints=NO;
    self.forgetPasswordButton.layer.backgroundColor=[UIColor clearColor].CGColor;
    [self.forgetPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.forgetPasswordButton setTitleColor:PINK_COLOR forState:UIControlStateNormal];
    [self.forgetPasswordButton addTarget:self action:@selector(forgetPasswordButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetPasswordButton];
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView.mas_right).with.offset(-FORGET_BUTTON_PADDING_RIGHT);
        make.bottom.equalTo(superView.mas_bottom).with.offset(-FORGET_BUTTON_PADDING_BOTTOM);
    }];
    
}

#pragma mark-ForgetPassword Method Area
-(void)forgetPasswordButtonTouched{
    ForgetPasswordViewController *forgetCtrl=[[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgetCtrl animated:YES];
}


#pragma mark-Login Method Area

-(void)loginButtonTouched{
    [self.accountText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    if([self inputIsLegal]){
        [self loginWithAcoount:self.accountText.text rawPassword:self.passwordText.text];
    }
}

-(BOOL)inputIsLegal{
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGULAR_EXPRESSION_MOBILE_PHONE];
    NSPredicate *regexPassword = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGULAR_EXPRESSION_PASSWORD];
    if(![regexMobile evaluateWithObject:self.accountText.text]){
        DLog(@"phone can't pass");
        return NO;
    }
    if(![regexPassword evaluateWithObject:self.passwordText.text]){
        DLog(@"password can't pass");
        return NO;
    }
    return YES;
}


-(void)loginWithAcoount:(NSString*)account rawPassword:(NSString*)password{
    
    NSString *MD5password=password.MD5Encrypt;

    NSDictionary *postInfo=@{loginTypeKey:loginTypeValue,accountKey:account,passwordKey:MD5password};
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    [manager POST:LOGIN_PATH parameters:postInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
#warning this area hasn't finished,beacause main controller hasn't write.
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSInteger errorStatCode=operation.response.statusCode;
        if(errorStatCode == AUTHENTICATED_FAIL){
            [self showHUDWithString:authenticatedFailString showingTime:3.0];
        }
        else if(errorStatCode == BAD_REQUEST){
            [self showHUDWithString:badRequestString showingTime:3.0];
        }
        else{
            DLog(@"Unknow Error:%li\n%@\nErrorString is %@",(long)errorStatCode,error,[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        }
    }];
    
}

-(void)showHUDWithString:(NSString*)string showingTime:(NSTimeInterval)timeInterval{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.labelText=string;
    [hud hide:YES afterDelay:timeInterval];
}


@end
