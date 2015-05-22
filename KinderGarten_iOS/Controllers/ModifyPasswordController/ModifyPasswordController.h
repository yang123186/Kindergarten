//
//  ModifyPasswordController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyPasswordViewController.h"
#import "LoginController.h"

@interface ModifyPasswordController : UIViewController<LoginDelegate>

@property   (nonatomic,strong)  ModifyPasswordViewController    *viewController;

-(instancetype)init;

-(void)commitNewPassword;


/**
 *  LoginController's delegate,do nothing about this
 */
-(void)loginSuccess;
@end
