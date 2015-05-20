//
//  ClassLitemodal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassLiteModal : NSObject

@property   (nonatomic,strong)  NSMutableArray  *classContainer;


/**
 *  Base initialize
 *
 *  @return A ClassLiteModal
 */
-(instancetype)init;

/**
 *  Notice!:used in KVO,don't use this to initialize.
 *
 *  @param array The Json type array.
 *
 *  @return A ClassLiteModal
 */
-(instancetype)initWithArray:(NSArray *)array;



/**
 *  Get the classId by its index
 *
 *  @param index the index of the destination classId.
 *
 *  @return A NSString type instance.
 */
-(NSString*)classIdAtIndex:(NSUInteger)index;


@end


