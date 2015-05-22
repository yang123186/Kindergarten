//
//  ModifyPasswordController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ModifyPasswordController.h"
#import "General.h"


static  NSString    *errorNewPasswordIllegal=@"新密码不合法";
static  NSString    *errorBadRequest=@"请求格式错误";
static  NSString    *errorAuthenticatedFail=@"需要重新登陆";
static  NSString    *errorOldPasswordWrong=@"原密码错误";
static  NSString    *errorUserUnSearched=@"用户未找到";
static  NSString    *errorRemoteServerError=@"内部错误";

static  NSString    *localErrorPasswordIllegal=@"新密码不合法";

@implementation ModifyPasswordController

-(instancetype)init{
    if(self=[super init]){
        
    }
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.viewController=[[ModifyPasswordViewController alloc]initWithRootController:self];
    
}



-(void)commitNewPassword{
    NSString *freshPassword=self.viewController.freshPasswordText.text;
    NSString *repeatPassword=self.viewController.repeatPasswordText.text;
    if([freshPassword isEqualToString:repeatPassword]){
        if([self freshPasswordIsLegal]){
            NSString *oldPassword=self.viewController.oldPasswordText.text.MD5Encrypt;
            NSString *encryptNewPassword=freshPassword.MD5Encrypt;
            
            NSDictionary *passwordInfo=@{@"originPassword":oldPassword,@"newPassword":encryptNewPassword};
            
            AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
            [manager beJsonManager];
            [manager setCommonlyUsedRequsetHeaderFiled];
            DLog(@"header:%@",manager.requestSerializer.HTTPRequestHeaders);
            
            [manager PATCH:MODIFY_PASSWORD_PATH parameters:passwordInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                if(operation.response.statusCode==REQUEST_SUCCESS){
                    DLog(@"modify password success");
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    DLog(@"ModifyPasswordController :modify get a unexpected Success code:%li\n%@",(long)operation.response.statusCode,responseObject);
                }
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                switch (operation.response.statusCode) {
                    case BAD_REQUEST:
                        [MBProgressHUD showHUDWithString:errorBadRequest showingTime:defaultTimeInterVal onView:self.view];
                        break;
                    case AUTHENTICATED_FAIL:
                        [MBProgressHUD showHUDWithString:errorAuthenticatedFail showingTime:defaultTimeInterVal onView:self.view];
                        [self presentLoginController];
                        break;
                    case PASSWORD_WRONG:
                        [MBProgressHUD showHUDWithString:errorOldPasswordWrong showingTime:defaultTimeInterVal onView:self.view];
                        break;
                    case USER_UNSEARCHED:
                        [MBProgressHUD showHUDWithString:errorUserUnSearched showingTime:defaultTimeInterVal onView:self.view];
                        break;
                    case REMOTE_SERVER_ERROR:
                        [MBProgressHUD showHUDWithString:errorRemoteServerError showingTime:defaultTimeInterVal onView:self.view];
                        break;
                    default:
                        DLog(@"ModifyPasswordController unknow error:%@\n\n response Data is:%@",error,[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
                        break;
                }
                
                
            }];
            
        }
        else{
            [MBProgressHUD showHUDWithString:errorNewPasswordIllegal showingTime:defaultTimeInterVal onView:self.view];
        }
    }
}

-(BOOL)freshPasswordIsLegal{
    if([self.viewController.freshPasswordText.text checkWithRegularExpression:REGULAR_EXPRESSION_PASSWORD]){
        return YES;
    }
    else{
        [MBProgressHUD showHUDWithString:localErrorPasswordIllegal showingTime:defaultTimeInterVal onView:self.view];
        return NO;
    }
}

-(void)presentLoginController{
    LoginController *loginCtrl=[[LoginController alloc]initWithSuperController:self];
    [self presentViewController:loginCtrl animated:YES completion:nil];
}


#pragma mark LoginDelegate
-(void)loginSuccess{
    
}


@end
