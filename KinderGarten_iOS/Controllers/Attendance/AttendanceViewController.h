//
//  AttendanceViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AttendanceController;
@interface AttendanceViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    AttendanceController    *controller;
@property   (nonatomic,weak)    UIView                  *view;
@property   (nonatomic,strong)  UITableView             *tableView;

-(instancetype)initWithRootController:(AttendanceController*)controller;


@end
