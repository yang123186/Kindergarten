//
//  PraiseLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/25/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SocialLikesContainer;
@interface PraiseLabel : UILabel<UITextViewDelegate>

-(instancetype)init;

-(void)setViewWithSocialLikesContainer:(SocialLikesContainer*)continer;


@end
