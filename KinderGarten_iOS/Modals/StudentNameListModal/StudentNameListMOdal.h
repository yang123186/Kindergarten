//
//  StudentNameListMOdal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/30/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentNameListMOdal : NSObject

@property   (nonatomic,copy) NSString   *name;
@property   (nonatomic,copy) NSString   *avatar;
@property   (nonatomic,copy) NSString   *_id;

-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;
@end


@interface FlowerStudentsContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *students;

-(instancetype)init;

-(instancetype)initWithArray:(NSArray*)array;

-(StudentNameListMOdal*)modalAtIndex:(NSInteger)index;

@end