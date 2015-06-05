//
//  AttendanceModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceBrief.h"

@interface AttendanceModal : NSObject

@property   (nonatomic,copy)    NSString    *source;
@property   (nonatomic,strong)  SourceBrief *cSourceUserBrief;
@property   (nonatomic,strong)  SourceBrief *cStudentBrief;
@property   (nonatomic,copy)    NSString    *_class;
@property   (nonatomic,copy)    NSString    *type;
@property   (nonatomic,copy)    NSString    *picture;
@property   (nonatomic,copy)    NSString    *time;



-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
