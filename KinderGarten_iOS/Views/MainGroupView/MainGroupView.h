//
//  MainGroupView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainGroupButtonDelegate.h"

@interface MainGroupView : UIView

@property   (nonatomic,weak)    id<MainGroupViewDelegate>delegate;

/**
 *  initialize a MainGroupView instance.
 *
 *  @param number the button number
 *  @param icons  the buttons' icons
 *  @param titles the buttons' titles
 *
 *  @return A initialized MainGroupView instance.
 */
-(instancetype)initWithItemNumer:(NSUInteger)number icons:(NSArray*)icons titles:(NSArray*)titles;


/**
 *  caculate the best height for the instance view.
 *
 *  @return the recommend view height
 */
-(CGFloat)height;
@end
