//
//  LineTextView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NSString(LineTextViewExtention)
-(NSString*)MD5Encrypt;
@end


@interface LineTextView : UITextField

/**
 *  Initialize a LineTextView and set the left and right content padding with parameter @padding.
 *
 *  @param padding A CGFloat type number.
 *
 *  @return A LineTextView Instance.
 */
-(instancetype)initWithHorizontalPadding:(CGFloat)padding;


/**
 *  Just simple init is OK~ defalut conttent padding is 0.
 *
 *  @return A LineTextView Instance
 */
-(instancetype)init;


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


/**
 *  Encrypt LineTextView's text to MD5.
 *
 *  @return A MD5 string.
 */
-(NSString*)MD5Value;
@end
