//
//  AttendanceController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendanceViewController.h"
#import "AttendanceContainer.h"

@interface AttendanceController : UIViewController

@property   (nonatomic,strong)  AttendanceViewController    *viewController;
@property   (nonatomic,strong)  AttendanceContainer         *container;

-(instancetype)init;

-(void)didSelectedItemAtIndex:(NSInteger)index;

@end
