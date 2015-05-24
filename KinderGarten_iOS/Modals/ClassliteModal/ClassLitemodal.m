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
        
    }
    return self;
}

-(instancetype)initWithClassDictionary:(NSDictionary *)dictionary{
    if (self=[self init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

@end


@implementation ClassLiteContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.classContainer){
            [self.classContainer removeAllObjects];
        }
        else{
            self.classContainer=[[NSMutableArray alloc]init];
        }
    }
    return self;
}


-(instancetype)initWithClassIdArray:(NSArray *)array{
    if(self=[self init]){
        [self.classContainer addObjectsFromArray:array];
    }
    return self;
}


-(instancetype)initWithClassModalsArray:(NSArray *)array{
    if(self=[self init]){
        for(NSDictionary *dic in array){
            ClassLiteModal *modal=[[ClassLiteModal alloc]initWithClassDictionary:dic];
            [self.classContainer addObject:modal];
        }
    }
    return self;
}

-(NSString*)classIdAtIndex:(NSUInteger)index{
    return [self.classContainer objectAtIndex:index];
}

-(ClassLiteModal*)modalAtIndex:(NSUInteger)index{
    return [self.classContainer objectAtIndex:index];
}

@end
