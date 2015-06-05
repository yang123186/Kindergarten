//
//  AppDelegate.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AppDelegate.h"
#import "SuperNavgationController.h"

#import "MainController.h"

#import "LoginController.h"

@interface AppDelegate ()

@end

static AppDelegate  *theAppdelegate;

@implementation AppDelegate

+(instancetype)sharedAppDelegate{
    return theAppdelegate;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    theAppdelegate=self;
    
    
    //CookiObserve
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] addObserver:self.gObserver forKeyPath:@"cookies" options:NSKeyValueObservingOptionNew context:nil];
    
    self.userModal=[[UserModal alloc]init];
    
    
    //Make a new window and set root view is supernavCrtl.
    MainController *mainCtrl=[[MainController alloc]init];
    SuperNavgationController *navCtrl=[[SuperNavgationController alloc]initWithRootViewController:mainCtrl];
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:navCtrl];
    
    
    [self.window makeKeyAndVisible];

    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] removeObserver:self.gObserver forKeyPath:@"cookies"];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
