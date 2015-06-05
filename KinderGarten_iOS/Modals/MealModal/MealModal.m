//
//  MealModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MealModal.h"
#import "General.h"
@implementation MealModal

-(instancetype)init{
    if(self=[super init]){
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if(self=[self init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    DLog(@"MealModal:unknow key :%@ ",key);
}

@end



@implementation MealContainer

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

-(instancetype)initWithArray:(NSArray *)array{
    if(self=[self init]){
        for (NSDictionary *dic in array) {
            MealModal *modal=[[MealModal alloc]initWithDictionary:dic];
            [self.container addObject:modal];
        }
        
    }
    return self;
}

-(MealModal*)modalAtIndex:(NSInteger)index{
    return [self.container objectAtIndex:index];
}
@end
