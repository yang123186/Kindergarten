//
//  StudentsModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentContactModal.h"
@interface StudentModal : NSObject

@property   (nonatomic,copy)    NSString    *icon;
@property   (nonatomic,copy)    NSString    *name;
@property   (nonatomic,copy)    NSString    *littleName;
@property   (nonatomic,copy)    NSString    *englishName;
@property   (nonatomic,copy)    NSString    *birthday;
@property   (nonatomic,assign)  NSInteger   age;
@property   (nonatomic,strong)  ParentContactContainer  *cParents;

-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end


@interface StudentsContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray *students;

#warning Still waiting for Modal....
-(instancetype)init;

-(instancetype)initWithArray:(NSArray*)array;

-(StudentModal*)modalAtIndex:(NSUInteger)index;
@end
