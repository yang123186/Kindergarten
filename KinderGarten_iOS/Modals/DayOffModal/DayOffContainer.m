//
//  DayOffContainer.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DayOffContainer.h"

@implementation DayOffContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.container){
            [self.container removeAllObjects];
        }
        else{
            self.container=[[NSMutableArray alloc]initWithCapacity:0];
        }
    }
    return self;
}


-(instancetype)initWithDayOffArray:(NSArray *)array{
    if(self=[self init]){
        for(NSDictionary *dic in array){
            DayOffModal *modal=[[DayOffModal alloc]initWithDictionary:dic];
            [self.container addObject:modal];
        }
    }
    return self;
}

-(DayOffModal*)modalAtIndex:(NSInteger)index{
    return [self.container objectAtIndex:index];
}

@end
