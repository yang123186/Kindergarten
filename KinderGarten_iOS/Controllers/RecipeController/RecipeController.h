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

@interface RecipeController : UIViewController<WeekTopViewDelegate>

@property   (nonatomic,strong)  RecipeViewController    *viewController;

-(instancetype)init;

@end
