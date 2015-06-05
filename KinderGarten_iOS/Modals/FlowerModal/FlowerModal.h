//
//  FlowerModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlowerModal : NSObject

@property   (nonatomic,copy)    NSString    *name;
@property   (nonatomic,copy)    NSString    *icon;
@property   (nonatomic,copy)    NSString    *_id;

-(instancetype)init;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FlowerContainer : NSObject
@property   (nonatomic,strong)  NSMutableArray  *container;

-(instancetype)init;

-(instancetype)initWithArray:(NSArray*)array;

-(FlowerModal*)modalAtIndex:(NSUInteger)index;

@end