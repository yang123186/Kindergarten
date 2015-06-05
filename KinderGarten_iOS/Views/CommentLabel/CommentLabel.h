//
//  CommentLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RichLabel.h"
#import "SocialCommentContainer.h"
@interface CommentLabel : RichLabel
@property   (nonatomic,readonly,assign) BOOL constraintSetted;

@property   (nonatomic,assign)  CGFloat width;

-(instancetype)initWithWidth:(CGFloat)width;

-(void)setViewForModal:(SocialCommentModal*)modal;

//-(CGFloat)height;

@end
