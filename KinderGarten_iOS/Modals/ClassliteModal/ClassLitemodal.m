//
//  ClassLitemodal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ClassLitemodal.h"

@implementation ClassLiteModal

-(instancetype)init{
    if(self=[super init]){
        self.classContainer=[[NSMutableArray alloc]init];
    }
    return self;
}


-(instancetype)initWithArray:(NSArray *)array{
    [self.classContainer removeAllObjects];
    [self.classContainer addObjectsFromArray:array];
    return self;
}

-(NSString*)classIdAtIndex:(NSUInteger)index{
    return [self.classContainer objectAtIndex:index];
}

@end
