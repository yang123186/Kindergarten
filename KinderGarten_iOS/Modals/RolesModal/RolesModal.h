//
//  RolesModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RolesModal : NSObject

@property   NSMutableArray *roles;


/**
 *  Base initialize ,it's safe to use.
 *
 *  @return A RolesModal instance.
 */
-(instancetype)init;

/**
 *  used on KVO,do not use this method to initialize!
 *
 *  @param array Roles Array.
 *
 *  @return A RolesModal instance.
 */
-(instancetype)initWithArray:(NSArray*)array;

@end

