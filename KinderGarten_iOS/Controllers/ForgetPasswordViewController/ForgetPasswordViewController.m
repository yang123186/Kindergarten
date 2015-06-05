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
    
}



@end
