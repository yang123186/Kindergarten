//
//  NameListController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentNameListMOdal.h"

@interface NameListController : UICollectionViewController

@property   (nonatomic,strong)  FlowerStudentsContainer   *container;

-(instancetype)init;

@end
