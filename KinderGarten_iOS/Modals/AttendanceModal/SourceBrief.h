//
//  SourceBrief.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SourceBrief : NSObject

@property   (nonatomic,copy)    NSString    *name;
@property   (nonatomic,copy)    NSString    *avatar;
@property   (nonatomic,copy)    NSString    *user;
@property   (nonatomic,copy)    NSString    *student;

-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
