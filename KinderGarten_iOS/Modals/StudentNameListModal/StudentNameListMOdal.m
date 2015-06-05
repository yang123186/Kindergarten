//
//  StudentNameListMOdal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "StudentNameListMOdal.h"
#import "General.h"

@implementation StudentNameListMOdal

-(instancetype)init{
    if(self=[super init]){
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self=[self init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    DLog(@"StudentNameListMOdal : unknow key:%@",key);
}


@end


@implementation FlowerStudentsContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.students){
            [self.students removeAllObjects];
        }
        else{
            self.students=[[NSMutableArray alloc]initWithCapacity:0];
        }
    }
    return self;
}

-(instancetype)initWithArray:(NSArray *)array{
    if(self=[super init]){
        for(NSDictionary *dic in array){
            StudentNameListMOdal *modal=[[StudentNameListMOdal alloc]initWithDictionary:dic];
            [self.students addObject:modal];
        }
    }
    return self;
}

-(StudentNameListMOdal*)modalAtIndex:(NSInteger)index{
    return [self.students objectAtIndex:index];
}

@end





