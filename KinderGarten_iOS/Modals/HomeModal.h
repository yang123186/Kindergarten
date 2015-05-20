//
//  HomeModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModal.h"
#import "TopicModal.h"

/**
 *  Used on HomepageController.
 */
@interface HomeModal : NSObject

@property   (nonatomic,assign)  NSInteger   statusCode;
@property   (nonatomic,copy)    NSString    *debugMessage;
@property   (nonatomic,strong)  UserModal   *cUser;
@property   (nonatomic,strong)  TopicModal  *cTopic;



/**
 *  Base initialize ,use it is safe.
 *
 *  @return A HomeModal instance.
 */
-(instancetype)init;



/**
 *  Actually it's not a initialize method,it's used on KVO
 *
 *  @param dictionary Home JSONt type dictionary.
 *
 *  @return A HomeModal instance.
 */
-(instancetype)initWithDictioary:(NSDictionary*)dictionary;
@end
