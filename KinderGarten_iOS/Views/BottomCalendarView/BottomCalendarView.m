//
//  BottomCalendarView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "BottomCalendarView.h"
#import "General.h"

static const CGFloat    barHeight=50.0f;

@implementation BottomCalendarView

-(instancetype)init{
    if (self=[super init]) {
        [self createView];
    }
    return self;
}

-(void)createView{
    self.lastWeekButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"lastWeek"] style:UIBarButtonItemStylePlain target:self action:@selector(needLastWeek)];
    [self.lastWeekButton setTintColor:PINK_COLOR];
    
    self.nextWeekButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nextWeek"] style:UIBarButtonItemStylePlain target:self action:@selector(needNextWeek)];
    [self.nextWeekButton setTintColor:PINK_COLOR];
    
    self.calendarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"calendar"] style:UIBarButtonItemStylePlain target:self action:@selector(calendarShow)];
    [self.calendarButton setTintColor:PINK_COLOR];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *items=[NSArray arrayWithObjects:self.lastWeekButton,flexible,self.calendarButton,flexible,self.nextWeekButton, nil];
    [self setItems:items animated:YES];
    
}

+(CGFloat)height{
    return barHeight;
}


-(void)needLastWeek{
    if([self.achiever respondsToSelector:@selector(lastWeekButtonTouched)]){
        [self.achiever lastWeekButtonTouched];
    }
}

-(void)needNextWeek{
    if([self.achiever respondsToSelector:@selector(nextWeekButtonTouched)]){
        [self.achiever nextWeekButtonTouched];
    }
}

-(void)calendarShow{
    if([self.achiever respondsToSelector:@selector(calendarButtonTouched)]){
        [self.achiever calendarButtonTouched];
    }
}

@end
