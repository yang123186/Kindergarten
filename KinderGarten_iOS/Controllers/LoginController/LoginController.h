//
//  LoginController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

-(instancetype)init;

/**
 *  You can implement auto login by using this method.
 *
 *  @param account  The account
 *  @param password The password,without MD5 encrypt
 */
-(void)loginWithAcoount:(NSString*)account rawPassword:(NSString*)password;

@end
