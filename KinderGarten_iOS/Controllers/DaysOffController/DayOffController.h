//
//  DayOffController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DayOffViewController.h"
#import "DayOffContainer.h"


static NSString *observeStartDateKey=@"dayOffStartDate";
static NSString *observeEndDateKey=@"dayOffEndDate";
static NSString *observeTypeKey=@"dayOffType";

typedef enum : NSUInteger {
    LeaveForSick=0,
    LeaveForAbsence=1,
} DayOffType;

@interface DayOffController : UIViewController

@property   (nonatomic,strong)  NSDate  *dayOffStartDate;
@property   (nonatomic,strong)  NSDate  *dayOffEndDate;
@property   (nonatomic,assign)  DayOffType  dayOffType;

@property   (nonatomic,strong)  DayOffContainer *container;

@property   (nonatomic,strong)  DayOffViewController *viewController;

-(instancetype)init;

-(void)commitDayOffRequest;

@end
