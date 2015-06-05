//
//  PushNotificationController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PushNotificationController.h"
#import "AppDelegate.h"

@implementation PushNotificationController

-(instancetype)init{
    if(self=[super init]){
        self.modal=[AppDelegate sharedAppDelegate].userModal.settingModal;
    }
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.viewController=[[PushNotificationViewController alloc]initWithRootController:self];
}


#pragma mark SwitchCellDelegate

-(void)switchCell:(SwitchCell*)cell didChangedSwitch:(BOOL)newStat{
    
}


-(void)showTimeDuration{
    
}

@end
