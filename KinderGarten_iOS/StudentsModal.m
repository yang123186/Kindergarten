//
//  StudentsModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "StudentsModal.h"

@implementation StudentModal

-(instancetype)init{
    if(self=[super init]){
        self.cParents=[[ParentContactContainer alloc]init];
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"parents"]){
        
    }
}

@end



@implementation StudentsContainer

-(instancetype)init{
    if(self=[super init]){
        self.students=[[NSMutableArray alloc]init];
    }
    return self;
}

-(instancetype)initWithArray:(NSArray *)array{
    [self.students removeAllObjects];
    for(NSDictionary *rawDic in array){
        StudentModal *modal=[[StudentModal alloc]initWithDictionary:rawDic];
        [self.students addObject:modal];
    }
    return self;
}

-(StudentModal*)modalAtIndex:(NSUInteger)index{
    return [self.students objectAtIndex:index];
}

@end
