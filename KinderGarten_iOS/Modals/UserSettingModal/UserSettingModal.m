//
//  UserSettingModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "UserSettingModal.h"

@implementation UserSettingModal

-(instancetype)init{
    if(self=[super init]){
        self.pushMessageSwitch=YES;
        self.pushMessageAcceptStartTime=@"00:00";
        self.pushMessageAcceptEndTime=@"00:00";
        self.pushMessageSoundSwitch=YES;
        self.pushMessageShakeSwitch=NO;
    }
    return self;
}




@end
