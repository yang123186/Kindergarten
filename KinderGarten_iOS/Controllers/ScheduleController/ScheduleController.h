//
//  ScheduleController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleViewController.h"
#import "WeekTopView.h"
#import "BottomCalendarView.h"
#import "ScheduleModal.h"

@interface ScheduleController : UIViewController<WeekTopViewDelegate,BottomCalendarDelegate>

@property   (nonatomic,strong)  ScheduleViewController    *viewController;

@property   (nonatomic,strong)  ScheduleModal               *modal;

@property   (nonatomic,strong,readonly)  NSDate  *defaultDate;


-(instancetype)init;

-(void)requsetRecipeWithOffset:(NSInteger)offset;

-(void)selectedDate:(NSDate*)date;
@end
