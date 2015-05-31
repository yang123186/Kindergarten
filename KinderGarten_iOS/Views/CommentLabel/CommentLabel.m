//
//  CommentLabel.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "CommentLabel.h"

@implementation CommentLabel

-(instancetype)initWithWidth:(CGFloat)width{
    if(self=[super initWithWidth:width]){
        self.width=width;
        _constraintSetted=NO;
    }
    return self;
}


-(void)setViewForModal:(SocialCommentModal *)modal{
    [self appendUserWithName:modal.cUserBrief.appellation UserLink:modal.cUserBrief._id];
    [self appendContent:[NSString stringWithFormat:@" : %@",modal.content]];
}


@end
