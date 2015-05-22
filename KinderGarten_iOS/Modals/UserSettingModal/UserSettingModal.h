//
//  UserSettingModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSettingModal : NSObject

@property   (nonatomic,assign)  BOOL        pushMessageSwitch;
@property   (nonatomic,copy)    NSString    *pushMessageAcceptStartTime;
@property   (nonatomic,copy)    NSString    *pushMessageAcceptEndTime;
@property   (nonatomic,assign)  BOOL        pushMessageSoundSwitch;
@property   (nonatomic,assign)  BOOL        pushMessageShakeSwitch;

-(instancetype)init;

@end
