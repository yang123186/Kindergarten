//
//  DayOffViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewCell.h"

@class DayOffController;
@interface DayOffViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,strong)  UITableView     *tableView;

@property   (nonatomic,strong)  UITableViewCell *dayOffStartCell;
@property   (nonatomic,strong)  UITableViewCell *dayOffEndCell;

@property   (nonatomic,strong)  UITableViewCell *dayOffTypeCell;
@property   (nonatomic,strong)  TextViewCell      *dayOffReason;

@property   (nonatomic,weak)   DayOffController *controller;
@property   (nonatomic,weak)    UIView          *view;


-(instancetype)initWithRootController:(DayOffController*)controller;

@end
