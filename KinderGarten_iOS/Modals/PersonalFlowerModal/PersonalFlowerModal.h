//
//  PersonalFlowerModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlowerModal.h"

@interface PersonalFlowerModal : NSObject

@property   (nonatomic,copy)  NSString    *senderAppellation;
@property   (nonatomic,strong)  FlowerModal *cFlowers;
@property   (nonatomic,copy)  NSString    *time;
@property   (nonatomic,copy)    NSString    *studentAvatar;
@property   (nonatomic,copy)    NSString    *studentId;

-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end


@interface PersonalFlowerContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *container;


-(instancetype)init;

-(instancetype)initWithArray:(NSArray*)array;

-(PersonalFlowerModal*)modalAtIndex:(NSInteger)index;

@end