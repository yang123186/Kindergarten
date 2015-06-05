//
//  BottomCalendarView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomCalendarDelegate <NSObject>

-(void)lastWeekButtonTouched;
-(void)nextWeekButtonTouched;
-(void)calendarButtonTouched;

@end


@interface BottomCalendarView : UIToolbar

@property   (nonatomic,strong)  UIBarButtonItem    *lastWeekButton;
@property   (nonatomic,strong)  UIBarButtonItem    *nextWeekButton;
@property   (nonatomic,strong)  UIBarButtonItem    *calendarButton;

@property   (nonatomic,weak)    id<BottomCalendarDelegate> achiever;

-(instancetype)init;

+(CGFloat)height;


@end
