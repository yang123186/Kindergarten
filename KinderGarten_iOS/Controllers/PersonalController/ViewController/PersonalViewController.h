//
//  PersonalViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PersonalController;
@interface PersonalViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    PersonalController  *controller;
@property   (nonatomic,weak)    UIView              *view;
@property   (nonatomic,strong)  UITableView         *tableView;

-(instancetype)initWithRootController:(PersonalController*)controller;;

@end
