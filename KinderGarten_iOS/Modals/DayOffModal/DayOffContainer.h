//
//  DayOffContainer.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayOffModal.h"

@interface DayOffContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *container;

-(instancetype)init;

-(instancetype)initWithDayOffArray:(NSArray*)array;

-(DayOffModal*)modalAtIndex:(NSInteger)index;
@end
