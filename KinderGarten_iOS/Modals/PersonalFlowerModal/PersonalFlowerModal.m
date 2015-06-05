//
//  PersonalFlowerModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonalFlowerModal.h"
#import "General.h"
@implementation PersonalFlowerModal

-(instancetype)init{
    if (self=[super init]) {
        self.cFlowers=[[FlowerModal alloc]init];
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
    if([key isEqualToString:@"flowerInfo"]){
        self.cFlowers=[self.cFlowers initWithDictionary:value];
    }
    else if([key isEqualToString:@"studentInfo"]){
        self.studentAvatar=[value objectForKey:@"avatar"];
    }
    else{
        DLog(@"PersonalFlowerModal :unknow key%@",key);
    }
}

@end



@implementation PersonalFlowerContainer

-(instancetype)init{
    if (self=[super init]) {
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
        for (NSDictionary *dic in array) {
            PersonalFlowerModal *modal=[[PersonalFlowerModal alloc]initWithDictionary:dic];
            [self.container addObject:modal];
        }
    }
    return self;
}


-(PersonalFlowerModal*)modalAtIndex:(NSInteger)index{
    return [self.container objectAtIndex:index];
}


@end




