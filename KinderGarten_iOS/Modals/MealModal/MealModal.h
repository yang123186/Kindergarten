//
//  MealModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MealModal : NSObject

@property   (nonatomic,strong)  NSNumber    *type;
@property   (nonatomic,copy)    NSString    *thumb;
@property   (nonatomic,copy)    NSString    *name;
@property   (nonatomic,copy)    NSString    *_id;

-(instancetype)init;
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end


@interface MealContainer : NSObject
@property   (nonatomic,strong)  NSMutableArray  *container;

-(instancetype)init;
-(instancetype)initWithArray:(NSArray*)array;
-(MealModal*)modalAtIndex:(NSInteger)index;

@end