//
//  DayOffReasonController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DayOffController;
@interface DayOffReasonController : UITableViewController

@property   (nonatomic,weak)    DayOffController *preController;

-(instancetype)initWithPreController:(DayOffController*)controller;

@end
