//
//  DayOffController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DayOffController.h"
#import "General.h"


@interface DayOffController ()

@end

@implementation DayOffController

-(instancetype)init{
    if(self=[super init]){
        self.container=[[DayOffContainer alloc]init];
        self.dayOffStartDate=[NSDate date];
        self.dayOffEndDate=[NSDate date];
        self.dayOffType=LeaveForSick;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[DayOffViewController alloc]initWithRootController:self];
}


@end
