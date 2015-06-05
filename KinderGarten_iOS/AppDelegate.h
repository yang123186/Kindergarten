//
//  AppDelegate.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GObserver.h"
#import "UserModal.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) GObserver *gObserver;

@property (strong,nonatomic) UserModal *userModal;

+(instancetype)sharedAppDelegate;

@end

