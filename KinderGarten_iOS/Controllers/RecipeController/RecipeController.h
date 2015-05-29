//
//  RecipeController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeViewController.h"
#import "WeekTopView.h"
#import "RecipeModal.h"

@interface RecipeController : UIViewController<WeekTopViewDelegate,BottomCalendarDelegate>

@property   (nonatomic,strong)  RecipeViewController    *viewController;

@property   (nonatomic,strong)  RecipeModal             *modal;

@property   (nonatomic,strong,readonly)  NSDate  *defaultDate;


-(instancetype)init;

-(void)requsetRecipeWithOffset:(NSInteger)offset;

-(void)selectedDate:(NSDate*)date;
@end
