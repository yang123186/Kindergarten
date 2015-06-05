//
//  PersonFlowerController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonFlowerViewController.h"


@interface PersonFlowerController : UIViewController

@property   (nonatomic,strong)  PersonFlowerViewController  *viewController;

-(instancetype)initWithStudentId:(NSString*)studentId;

@end
