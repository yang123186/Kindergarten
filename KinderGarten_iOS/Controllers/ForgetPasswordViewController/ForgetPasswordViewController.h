//
//  ForgetPasswordViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ForgetPasswordViewController : UIViewController


/**
 *  will request server to get verify code.
 */
-(void)requestVerifyCodeButtonDidTouched;


/**
 *  Will send all information to server to reset password.
 */
-(void)commitPasswordInfo;


@end
