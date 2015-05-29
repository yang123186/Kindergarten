//
//  WeekTopView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeekTopViewDelegate <NSObject>

-(void)dayButtonDidSelectedAtDay:(NSInteger)day;

@end


@interface WeekTopView : UIView

@property   (nonatomic,weak)    id<WeekTopViewDelegate> delegate;

-(instancetype)initWithDefaultDay:(NSInteger)day;

+(CGFloat)height;

@end
