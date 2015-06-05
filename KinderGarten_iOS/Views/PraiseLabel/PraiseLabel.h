//
//  PraiseLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RichLabel.h"
#import "SocialLikesModal.h"

@interface PraiseLabel : RichLabel

-(void)setViewForContainer:(SocialLikesContainer*)container;
-(instancetype)initWithWidth:(CGFloat)width;

//-(CGFloat)height;
@end
