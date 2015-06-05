//
//  ClassLitemodal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassLiteModal : NSObject
@property   (nonatomic,strong)  NSString    *name;
@property   (nonatomic,strong)  NSString    *code;
@property   (nonatomic,strong)  NSString    *grade;
@property   (nonatomic,strong)  NSString    *intro;
@property   (nonatomic,strong)  NSString    *kindergarten;
@property   (nonatomic,strong)  NSString    *master;
@property   (nonatomic,strong)  NSArray     *teachers;


-(instancetype)init;

-(instancetype)initWithClassDictionary:(NSDictionary*)dictionary;

@end


@interface ClassLiteContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *classContainer;


/**
 *  Base initialize
 *
 *  @return A ClassLiteModal
 */
-(instancetype)init;

/**
 *  initialize and use KVC.
 *
 *  @param array The Json type array.
 *
 *  @return A ClassLiteContainer instance
 */
-(instancetype)initWithClassIdArray:(NSArray *)array;


/**
 *  Get the classId by its index
 *
 *  @param index the index of the destination classId.
 *
 *  @return A NSString type instance.
 */
-(NSString*)classIdAtIndex:(NSUInteger)index;


/**
 *  initialize and use KVC.
 *
 *  @param array the array contains ClassLiteModal infos.
 *
 *  @return A ClassLiteContainer instance
 */
-(instancetype)initWithClassModalsArray:(NSArray *)array;


/**
 *  Get the ClassLiteModal by its index
 *
 *  @param index index the index of the destination modal.
 *
 *  @return A ClassLiteModal.
 */
-(ClassLiteModal*)modalAtIndex:(NSUInteger)index;

@end


