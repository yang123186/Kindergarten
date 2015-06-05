//
//  PersonalController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalViewController.h"

@class StudentsModal;
@interface PersonalController : UIViewController

@property   (nonatomic,weak)    StudentsModal *modal;

@property   (nonatomic,strong)  PersonalViewController *viewController;

-(instancetype)initWithStudentModal:(StudentsModal*)modal;

@end
