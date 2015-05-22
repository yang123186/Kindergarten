//
//  PersonalController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonalController.h"

@implementation PersonalController

-(instancetype)initWithStudentModal:(StudentsModal *)modal{
    if(self=[super init]){
        self.modal=modal;
    }
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.viewController=[[PersonalViewController alloc]initWithRootController:self];
}

@end
