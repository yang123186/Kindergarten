//
//  AttendanceContainer.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceContainer.h"

@implementation AttendanceContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.container){
            [self.container removeAllObjects];
        }
        else{
            self.container=[[NSMutableArray alloc]init];
        }
    }
    return self;
}


-(instancetype)initWithArray:(NSArray *)array{
    if(self=[self init]){
        for(NSDictionary *dic in array){
            AttendanceModal *modal=[[AttendanceModal alloc]initWithDictionary:dic];
            [self.container addObject:modal];
        }
    }
    return self;
}

-(AttendanceModal*)modalAtIndexl:(NSUInteger)index{
    return [self.container objectAtIndex:index];
}

@end
