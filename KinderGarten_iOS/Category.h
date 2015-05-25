//
//  Category.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (CircleExtention)

-(void)setCircleRadius:(CGFloat)radius;

@end


@interface NSString(LineTextViewExtention)

-(NSString*)MD5Encrypt;

-(NSString*)userEasyKnowTimeFormat;

-(BOOL)checkWithRegularExpression:(NSString*)regularExpression;

@end





@interface UITextField(PaddingPlus)

/**
 *  Set the right inset padding
 *
 *  @param padding A CGFloat type number.
 */
-(void)setRightPadding:(CGFloat)padding;


/**
 *  Set the left inset padding
 *
 *  @param padding A CGFloat type number.
 */
-(void)setLeftPadding:(CGFloat)padding;



/**
 *  Set the left and right content padding with parameter @padding.
 *
 *  @param padding A CGFloat type number.
 */
-(void)setHorizontalPadding:(CGFloat)padding;



@end





@interface MBProgressHUD (StringStyle)

+(void)showHUDWithString:(NSString*)string showingTime:(NSTimeInterval)timeInterval onView:(UIView*)view;

@end