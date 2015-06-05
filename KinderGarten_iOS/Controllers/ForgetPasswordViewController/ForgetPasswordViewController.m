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
#import "ForgetViewController.h"

static NSString *successChangePwdMsg=@"修改密码成功";
static NSString *successUnknowStat=@"未知状态，请重新登录！";
static NSString *errorBadRequestMsg=@"请求格式错误";
static NSString *errorVerifyWrongMsg=@"短信验证码错误";
static NSString *errorUserNotFoundMsg=@"用户未找到";
static NSString *errorRemoteServerErrorMsg=@"服务器内部错误";
static NSString *errorUnknowErrorMsg=@"未知错误!";

@interface ForgetPasswordViewController()
@property   (nonatomic,strong)  ForgetViewController *viewController;

@end



@implementation ForgetPasswordViewController

-(instancetype)init{
    self=[super init];
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.viewController=[[ForgetViewController alloc]initWithRootController:self];
    
}




-(void)requestVerifyCodeButtonDidTouched{
    [self.viewController.requestVerifyCodeButton becomeFirstResponder];
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
    if(![self.viewController.accountText.text checkWithRegularExpression:REGULAR_EXPRESSION_MOBILE_PHONE]){
        DLog(@"phone can't pass");
        return NO;
    }
    return YES;
}



-(void)commitPasswordInfo{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSDictionary *postInfo=@{@"loginType":loginTypeValue,@"phone":self.viewController.accountText.text,@"textverify":self.viewController.verifyCodeText.text,@"newpass":self.viewController.freshPasswordText.text.MD5Encrypt};
    
    [manager PATCH:LOGIN_PATH parameters:postInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(operation.response.statusCode==REQUEST_SUCCESS){
            [MBProgressHUD showHUDWithString:successChangePwdMsg showingTime:defaultTimeInterVal onView:self.view];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            [MBProgressHUD showHUDWithString:successUnknowStat showingTime:defaultTimeInterVal onView:self.view];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        switch (operation.response.statusCode) {
            case BAD_REQUEST:
                [MBProgressHUD showHUDWithString:errorBadRequestMsg showingTime:defaultTimeInterVal onView:self.view];
                break;
            case VERIFYCODE_WRONG:
                [MBProgressHUD showHUDWithString:errorVerifyWrongMsg showingTime:defaultTimeInterVal onView:self.view];
                break;
            case USER_UNSEARCHED:
                [MBProgressHUD showHUDWithString:errorUserNotFoundMsg showingTime:defaultTimeInterVal onView:self.view];
                break;
            case REMOTE_SERVER_ERROR:
                [MBProgressHUD showHUDWithString:errorRemoteServerErrorMsg showingTime:defaultTimeInterVal onView:self.view];
                break;
            default:
                [MBProgressHUD showHUDWithString:errorUnknowErrorMsg showingTime:defaultTimeInterVal onView:self.view];
                break;
        }
    }];
}



@end
