//
//  RecipeViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekTopView.h"

@class RecipeController;
@interface RecipeViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    RecipeController *controller;
@property   (nonatomic,weak)    UIView           *view;

@property   (nonatomic,strong)  WeekTopView     *topView;
@property   (nonatomic,strong)  UITableView     *tableView;


-(instancetype)initWithRootController:(RecipeController*)controller;

@end
