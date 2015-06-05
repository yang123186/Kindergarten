//
//  praiseBar.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialLikesModal.h"

@interface PraiseBar : UIView


@property   (nonatomic,assign,readonly) CGFloat height;

-(instancetype)init;

-(void)setViewForSocialLikeModal:(SocialLikesContainer*)container;

-(instancetype)initWithSocialLikeModal:(SocialLikesContainer*)container;

@end
