//
//  AttendanceModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceModal.h"
#import "General.h"


@implementation AttendanceModal

-(instancetype)init{
    if(self=[super init]){
        self.cSourceUserBrief=[[SourceBrief alloc]init];
        self.cStudentBrief=[[SourceBrief alloc]init];
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
    if([key isEqualToString:@"sourceUserBrief"]){
        [self.cSourceUserBrief setValuesForKeysWithDictionary:value];
    }
    else if([key isEqualToString:@"studentBrief"]){
        [self.cStudentBrief setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"class"]){
        self._class=value;
    }
    else{
        DLog(@"AttendanceModal:unknow key:%@",key);
    }
}

@end
