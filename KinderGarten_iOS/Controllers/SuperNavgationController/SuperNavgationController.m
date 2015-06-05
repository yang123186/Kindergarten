//
//  SuperNavgationController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SuperNavgationController.h"
#import "ColorDefine.h"

@implementation SuperNavgationController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBarTintColor:PINK_COLOR];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:WHITE_COLOR}];
    [self.navigationBar setTintColor:WHITE_COLOR];
}

@end
