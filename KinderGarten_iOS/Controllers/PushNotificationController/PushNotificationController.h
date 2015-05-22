//
//  PushNotificationController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushNotificationViewController.h"
#import "UserSettingModal.h"

@interface PushNotificationController : UIViewController<SwitchCellDelegate>

@property   (nonatomic,strong)  PushNotificationViewController  *viewController;

@property   (nonatomic,weak)    UserSettingModal                *modal;


-(void)showTimeDuration;

@end
