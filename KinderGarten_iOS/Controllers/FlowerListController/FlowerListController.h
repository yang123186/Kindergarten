//
//  FlowerListController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowerModal.h"


@interface FlowerListController : UICollectionViewController

@property   (nonatomic,strong)  FlowerContainer *container;

-(instancetype)initWithStudentId:(NSString*)studentId;

@end
