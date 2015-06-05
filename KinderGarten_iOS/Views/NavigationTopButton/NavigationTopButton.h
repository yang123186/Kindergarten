//
//  NavigationTopButton.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationTopButtonDelegate <NSObject>

-(void)buttonTouchedAtIndex:(NSUInteger)index;

@end


@interface NavigationTopButton : UIView

@property   (nonatomic,assign,readonly)  NSUInteger  buttonNumber;
@property   (nonatomic,weak)            id<NavigationTopButtonDelegate> delegate;


-(instancetype)initWithButtonNumber:(NSUInteger)number;

+(CGFloat)height;

-(void)setTitlesWithArray:(NSArray*)array;

@end
