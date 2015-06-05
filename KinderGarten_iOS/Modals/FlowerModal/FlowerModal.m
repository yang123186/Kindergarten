//
//  FlowerModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "FlowerModal.h"
#import "General.h"
@implementation FlowerModal

-(instancetype)init{
    if (self=[super init]) {
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    DLog(@"Flowermodal:unknow key:%@",key);
}

@end


@implementation FlowerContainer

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

-(instancetype)initWithArray:(NSArray*)array{
    if(self=[self init]){
        for (NSDictionary *dic in array) {
            FlowerModal *modal=[[FlowerModal alloc]initWithDictionary:dic];
            [self.container addObject:modal];
        }
        
    }
    return self;
}

-(FlowerModal*)modalAtIndex:(NSUInteger)index{
    return [self.container objectAtIndex:index];
}

@end


