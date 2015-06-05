//
//  RecipeViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekTopView.h"
#import "BottomCalendarView.h"
#import "DatePickerView.h"

@class RecipeController;
@interface RecipeViewController : NSObject<UITableViewDataSource,UITableViewDelegate,DatePickerViewDelegate>

@property   (nonatomic,weak)    RecipeController *controller;
@property   (nonatomic,weak)    UIView           *view;

@property   (nonatomic,strong)  WeekTopView     *topView;
@property   (nonatomic,strong)  UITableView     *tableView;
@property   (nonatomic,strong)  BottomCalendarView  *bottomView;

@property   (nonatomic,strong)  DatePickerView  *datePickerView;

@property   (nonatomic,strong)  NSDate          *defaultDay;

-(instancetype)initWithRootController:(RecipeController*)controller;

-(void)calendarShoulShow;
@end
