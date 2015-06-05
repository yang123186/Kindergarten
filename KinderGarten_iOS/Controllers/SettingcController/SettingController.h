//
//  SettingController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"




@interface SettingController : UIViewController<SettingListDelegate>

@property   (nonatomic,strong)  SettingViewController   *viewController;

/**
 *  it's setting controller,simple initialize is enough.
 *
 *  @return A SettingController.
 */
-(instancetype)init;


@end
