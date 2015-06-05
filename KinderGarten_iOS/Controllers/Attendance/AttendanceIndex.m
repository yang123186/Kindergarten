//
//  AttendanceIndex.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceIndex.h"
#import "AttendanceContainer.h"
#import "General.h"

@implementation AttendanceIndex

-(instancetype)init{
    if (self=[super init]) {
    }
    return self;
}

@end



@implementation AttendanceManager

-(instancetype)init{
    if (self=[super init]) {
        if(self.dateIndex){
            [self.dateIndex removeAllObjects];
        }
        else{
            self.dateIndex=[[NSMutableDictionary alloc]init];
        }
        if(self.attendanceRecords){
            [self.attendanceRecords removeAllObjects];
        }
        else{
            self.attendanceRecords=[[NSMutableArray alloc]initWithCapacity:0];
        }
    }
    return self;
}

-(instancetype)initWithContainer:(AttendanceContainer *)container{
    if (self=[self init]) {
        for (AttendanceModal *modal in container.container) {
            NSString *datePrefix=modal.time.UTCPrefixDate;
            NSNumber *index=[self.dateIndex objectForKey:datePrefix];
            if(index){
                AttendanceIndex *indexModal=[self.attendanceRecords objectAtIndex:index.integerValue];
                [self checkOutWithAttendanceIndex:modal withRecord:indexModal];
            }
            else{
                AttendanceIndex *freshModal=[[AttendanceIndex alloc]init];
                freshModal.datePreFix=modal.time.UTCPrefixDate;
                freshModal.picture=modal.picture;
                [self checkOutWithAttendanceIndex:modal withRecord:freshModal];
                [self.attendanceRecords addObject:freshModal];
                [self.dateIndex setObject:[NSNumber numberWithDouble:[self.attendanceRecords indexOfObject:freshModal]] forKey:freshModal.datePreFix];
            }
        }
    }
    return self;
}

-(void)checkOutWithAttendanceIndex:(AttendanceModal*)modal withRecord:(AttendanceIndex*)record{
    if([modal.type isEqualToString:@"签到"]){
        record.arriveTime=modal.time.UTCTime;
        record.signInSource=modal.source;
    }
    else if([modal.type isEqualToString:@"签退"]){
        record.leaveTime=modal.time.UTCTime;
        record.singOutSource=modal.source;
    }
    else{
        DLog(@"Unknow type to checkout");
    }
}


-(NSInteger)count{
    return self.attendanceRecords.count;
}

-(AttendanceIndex*)modalAtIndex:(NSInteger)index{
    return [self.attendanceRecords objectAtIndex:index];
}

@end