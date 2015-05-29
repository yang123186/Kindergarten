//
//  PraiseLabel.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PraiseLabel.h"

@interface PraiseLabel()
@property   (nonatomic,assign)  BOOL    firstName;

@end


@implementation PraiseLabel

-(instancetype)init{
    if(self=[super init]){
        self.firstName=YES;
    }
    return self;
}

-(void)setViewForContainer:(SocialLikesContainer *)container{
    for(SocialLikesModal *modal in container.aLikes){
        if(self.firstName){
            [self appendUserWithName:modal.name UserLink:modal._id];
            self.firstName=NO;
        }
        else{
            [self appendContent:@" , "];
            [self appendUserWithName:modal.name UserLink:modal._id];
        }
    }
}

@end
