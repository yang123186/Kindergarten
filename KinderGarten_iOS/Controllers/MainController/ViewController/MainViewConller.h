//
//  MainViewConller.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainGroupView.h"
#import "MainTopicView.h"
#import "MainIconView.h"

@class MainController;
@interface MainViewConller : NSObject
/**
 *  rootView&controller
 */
@property   (nonatomic,weak)    UIView              *view;
@property   (nonatomic,weak)    MainController    *controller;

/**
 *  subViews on rootView
 */
@property   (nonatomic,strong)  UIScrollView        *scrollView;

@property   (nonatomic,strong)  UIImageView         *topImageView;
@property   (nonatomic,strong)  MainTopicView       *topicView;
@property   (nonatomic,strong)  MainGroupView       *childGroupView;
@property   (nonatomic,strong)  MainGroupView       *functionGroupView;
@property   (nonatomic,strong)  MainGroupView       *bottomGroupView;

/**
 *  Navigation item
 */
@property   (nonatomic,strong)  MainIconView        *iconBarButton;
@property   (nonatomic,strong)  UIBarButtonItem     *settingBarButton;


-(instancetype)initWithRootController:(UIViewController*)controller;

-(void)createViews;

@end
