//
//  ScheduleCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString*    const scheduleCellIdentifier=@"ScheduleCell";

@interface ScheduleCell : UITableViewCell

@property   (nonatomic,strong) UILabel *timeLabel;
@property   (nonatomic,strong) UILabel *classLabel;

-(instancetype)init;

-(void)setView;

+(CGFloat)height;

@end
