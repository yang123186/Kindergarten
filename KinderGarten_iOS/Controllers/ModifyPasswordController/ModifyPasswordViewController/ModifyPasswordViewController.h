//
//  ModifyPasswordViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ModifyPasswordController;
@interface ModifyPasswordViewController : NSObject

@property   (nonatomic,strong)  UITextField *oldPasswordText;
@property   (nonatomic,strong)  UITextField *freshPasswordText;
@property   (nonatomic,strong)  UITextField *repeatPasswordText;
@property   (nonatomic,strong)  UIBarButtonItem *OKbutton;

@property   (nonatomic,weak)    ModifyPasswordController    *rootController;
@property   (nonatomic,weak)    UIView                      *view;

-(instancetype)initWithRootController:(ModifyPasswordController*)rootController;


@end
