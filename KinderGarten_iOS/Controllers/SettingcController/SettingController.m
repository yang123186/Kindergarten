//
//  SettingController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SettingController.h"
#import "General.h"

#import "ModifyPasswordController.h"
#import "PushNotificationController.h"
#import "FeedBackController.h"

static NSString *title=@"登陆";


@implementation SettingController

-(instancetype)init{
    if(self=[super init]){
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=title;
    [self.view setBackgroundColor:GRAY_BACKGROUND];
    self.viewController=[[SettingViewController alloc]initWithSuperController:self];
    self.viewController.delegate=self;
    [self.viewController createViews];
    [self.viewController.logoutButton addTarget:self action:@selector(logoutButtonTouched) forControlEvents:UIControlEventTouchUpInside];
}




-(void)logoutButtonTouched{
    
}


#pragma mark SettingListDelegate
-(void)modifyPasswordCellDidSelected{
    ModifyPasswordController *mdfPwdCtrl=[[ModifyPasswordController alloc]init];
    [self.navigationController pushViewController:mdfPwdCtrl animated:YES];
}


-(void)pushNotificationCellDidSelected{
    PushNotificationController *pushNtfCtrl=[[PushNotificationController alloc]init];
    [self.navigationController pushViewController:pushNtfCtrl animated:YES];
}


-(void)systemMessageCellDidSelected{
    
}


-(void)feedbackCellDidSelected{
   FeedBackController *feedBack=[[FeedBackController alloc]init];
   [self.navigationController pushViewController:feedBack animated:YES];
}


-(void)aboutUsCellDidSelected{
    
}


-(void)checkUpdateCellDidSelected{
    
}


@end
