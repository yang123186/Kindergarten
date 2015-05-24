//
//  HonorListViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NavigationTopButton.h"

@class HonorListController;
@interface HonorListViewController : NSObject<NavigationTopButtonDelegate>

@property   (nonatomic,weak)    HonorListController *controller;
@property   (nonatomic,weak)    UIView              *view;

-(instancetype)initWithRootController:(HonorListController*)controller;

@end
