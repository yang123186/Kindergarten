//
//  SourceBrief.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SourceBrief.h"
#import "General.h"

@implementation SourceBrief

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
    DLog(@"SourceBrief: unknow key:%@",key);
}

@end
