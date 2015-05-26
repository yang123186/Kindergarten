//
//  AttendanceCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendanceModal.h"
#import "ImageLabel.h"

static NSString *attendanceCellIdentifier=@"AttendanceCell";

@interface AttendanceCell : UITableViewCell

@property   (nonatomic,strong)  UILabel *dateLabel;
@property   (nonatomic,strong)  ImageLabel  *arriveLabel;
@property   (nonatomic,strong)  ImageLabel  *leaveLabel;

-(instancetype)init;

-(void)setViewForModal:(AttendanceModal*)modal;

-(instancetype)initWithModal:(AttendanceModal*)modal;


+(CGFloat)height;
@end
