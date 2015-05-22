//
//  MainController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainGroupView.h"
#import "LoginController.h"

@interface MainController : UIViewController<MainGroupViewDelegate,LoginDelegate>
-(void)settingBarButtonTouched;

-(void)getDatafromNetWork;
@end
