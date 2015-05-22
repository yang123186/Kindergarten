//
//  PushNotificationViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SwitchCell.h"


@class PushNotificationController;
@interface PushNotificationViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    PushNotificationController  *controller;
@property   (nonatomic,weak)    UIView                      *view;

@property   (nonatomic,strong)  UITableView                 *tableView;


-(instancetype)initWithRootController:(PushNotificationController*)controller;

@end
