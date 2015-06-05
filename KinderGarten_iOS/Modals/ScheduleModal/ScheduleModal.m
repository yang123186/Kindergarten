//
//  ScheduleModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ScheduleModal.h"
#import "General.h"
@implementation ScheduleModal

-(instancetype)init{
    if (self=[super init]) {
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
    DLog(@"ScheduleModal:unknow key :%@ ",key);
}
@end
