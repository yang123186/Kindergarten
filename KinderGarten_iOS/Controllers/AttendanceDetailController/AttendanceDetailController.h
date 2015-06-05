//
//  AttendanceDetailController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendanceIndex.h"

@interface AttendanceDetailController : UIViewController

@property   (nonatomic,strong)  UIImageView *imageView;
@property   (nonatomic,strong)  UITableViewCell *attendanceSourceLabel;
@property   (nonatomic,strong)  UITableViewCell *attendanceDateLabel;

@property   (nonatomic,strong)  AttendanceIndex *modal;

-(instancetype)initWithModal:(AttendanceIndex*)modal;

@end
