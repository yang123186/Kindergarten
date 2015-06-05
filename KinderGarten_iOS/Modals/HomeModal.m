//
//  HomeModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "HomeModal.h"
#import "General.h"

@implementation HomeModal


-(instancetype)init{
    if(self=[super init]){
        self.cUser=[[UserModal alloc]init];
        self.cTopic=[[TopicModal alloc]init];
    }
    return self;
}


-(instancetype)initWithDictioary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"user"]){
        self.cUser=[self.cUser initWithDictionary:value];
    }
    else if([key isEqualToString:@"topic"]){
        self.cTopic=[self.cTopic initWithDictionary:value];
    }
    else{
        DLog(@"HomeModal:get undefined key:%@",key);
    }
}

@end
