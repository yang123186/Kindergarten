//
//  RecipeController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RecipeController.h"

@interface RecipeController ()

@end

@implementation RecipeController

-(instancetype)init{
    if (self=[super init]) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[RecipeViewController alloc]initWithRootController:self];
}

-(void)dayButtonDidSelectedAtDay:(NSInteger)day{
    
}

@end
