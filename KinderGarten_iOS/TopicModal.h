//
//  TopicModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicOptionsModal : NSObject

@property   (nonatomic,copy)    NSString    *A;
@property   (nonatomic,copy)    NSString    *B;
@property   (nonatomic,copy)    NSString    *C;
@property   (nonatomic,copy)    NSString    *D;

/**
 *  Base initialize ,use it is safe.
 *
 *  @return A TopOptionsModal instance.
 */
-(instancetype)init;


/**
 *  Actually it's not a initialize,it's used on KVO when new value get.
 *
 *  @param dictionary A topicOptions JSON type dictionary.
 *
 *  @return A TopOptionsModal instance.
 */
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end



@interface TopicModal : NSObject

@property   (nonatomic,copy)    NSString    *title;
@property   (nonatomic,copy)    NSString    *picture;
@property   (nonatomic,copy)    NSString    *detail;
@property   (nonatomic,strong)  TopicOptionsModal   *cOptions;


/**
 *  Base initialize ,use it is safe.
 *
 *  @return A TopicModal instance.
 */
-(instancetype)init;


/**
 *  Actually it's not a initialize,it's used on KVO when new value get.
 *
 *  @param dictionary A topicOptions JSON type dictionary.
 *
 *  @return A TopicModal instance.
 */
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
