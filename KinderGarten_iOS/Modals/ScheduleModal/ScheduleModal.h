//
//  ScheduleModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleModal : NSObject

@property   (nonatomic,copy) NSString *_id;
@property   (nonatomic,copy) NSString *kindergarten;
@property   (nonatomic,copy) NSString *date;
@property   (nonatomic,copy) NSNumber *__v;

-(instancetype)init;
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;


@end
