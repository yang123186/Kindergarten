//
//  MainGroupButton.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainGroupButton : UIButton

@property   (strong,nonatomic)  UIImageView *picture;
@property   (strong,nonatomic)  UILabel     *title;


/**
 *  Initialize MainGroupButton.
 *
 *  @return A MainGroupButton instance.
 */
-(instancetype)init;


/**
 *  Set the button's image and title
 *
 *  @param image image the image showed on the button.
 *  @param title title the title showed on the button.
 */
-(void)setImage:(UIImage*)image title:(NSString*)title;


/**
 *  recommend use this method to initialize,it combine @init and @setImage:title methods.
 *
 *  @param image the image showed on the button.
 *  @param title the title showed on the button.
 *
 *  @return A MainGroupButton instance.
 */
-(instancetype)initWithImage:(UIImage*)image title:(NSString*)title;


+(CGFloat)requireHieght;
+(CGFloat)requireWidth;
@end
