//
//  AttendanceIndex.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AttendanceContainer;
@interface AttendanceIndex : NSObject

@property   (nonatomic,copy)    NSString    *datePreFix;
@property   (nonatomic,copy)    NSString    *arriveTime;
@property   (nonatomic,copy)    NSString    *leaveTime;
@property   (nonatomic,copy)    NSString    *picture;
@property   (nonatomic,copy)    NSString    *signInSource;
@property   (nonatomic,copy)    NSString    *singOutSource;

-(instancetype)init;

@end


@interface AttendanceManager : NSObject

@property   (nonatomic,strong)  NSMutableDictionary     *dateIndex;
@property   (nonatomic,strong)  NSMutableArray          *attendanceRecords;

-(instancetype)init;

-(instancetype)initWithContainer:(AttendanceContainer*)container;

-(NSInteger)count;

-(AttendanceIndex*)modalAtIndex:(NSInteger)index;

@end