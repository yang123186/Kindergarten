//
//  UserModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "UserModal.h"
#import "General.h"



@implementation UserModal

-(instancetype)init{
    if(self=[super init]){
        if(!self.cStudents){
            self.cStudents=[[StudentsContainer alloc]init];
        }
        if(!self.cClasses){
            self.cClasses=[[ClassLiteContainer alloc]init];
        }
        if(!self.cRoles){
            self.cRoles=[[RolesModal alloc]init];
        }
        if(!self.settingModal){
            self.settingModal=[[UserSettingModal alloc]init];
        }
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"students"]){
        self.cStudents=[self.cStudents initWithArray:value];
    }
    else if([key isEqualToString:@"classes"]){
        self.cClasses=[self.cClasses initWithClassIdArray:value];
    }
    else if([key isEqualToString:@"roles"]){
        self.cRoles=[self.cRoles initWithArray:value];
    }
    else{
        DLog(@"UserModal:get undefined key:%@",key);
    }
}

@end
