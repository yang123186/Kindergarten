//
//  IconList.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

static const    CGFloat edgeLength=30.0f;


@class MainIconView;
@interface IconList : UIView

@property   (nonatomic,weak)    MainIconView    *parentView;
@property   (nonatomic,strong)  NSMutableArray  *icons;

-(instancetype)initWithSuperView:(MainIconView*)superView Icons:(NSArray*)icons;

-(void)setIcons:(NSArray *)icons withShowingIndex:(NSUInteger)index;

-(void)setShowingIconAtIndex:(NSUInteger)index;

-(void)listShowAndDismiss;


@end

