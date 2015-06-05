//
//  FeedBackController.m
//  KinderGarten_iOS
//
//  Created by 杨容清 on 15/6/4.
//  Copyright (c) 2015年 Rdd7. All rights reserved.
//

#import "FeedBackController.h"
#import "LoginController.h"
#import "General.h"

static  NSString    *errorBadRequest=@"请求格式错误";
static  NSString    *errorAuthenticatedFail=@"需要重新登陆";
static  NSString    *errorOldPasswordWrong=@"原密码错误";
static  NSString    *errorUserUnSearched=@"用户未找到";
static  NSString    *errorRemoteServerError=@"内部错误";

@interface FeedBackController ()

@end

@implementation FeedBackController

-(instancetype) init{
    if(self = [super init]){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewController = [[FeedBackViewController alloc] initWithRootController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getFeedBackMessage{
    NSString *feedBackText = self.viewController.feedBackView.text;
    DLog(feedBackText);
    NSDictionary *feedBackContent = @{@"content":feedBackText};
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    DLog(@"header:%@",manager.requestSerializer.HTTPRequestHeaders);
    
    [manager PUT:FEED_BACK_PATH parameters:feedBackContent success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
            if(operation.response.statusCode==REQUEST_SUCCESS){
            DLog(@"advice pull success");
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            DLog(@"unexpected Success code:%li\n%@",(long)operation.response.statusCode,responseObject);
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}*/
-(void)presentLoginController{
    LoginController *loginCtrl=[[LoginController alloc]initWithSuperController:self];
    [self presentViewController:loginCtrl animated:YES completion:nil];
}


 



@end
