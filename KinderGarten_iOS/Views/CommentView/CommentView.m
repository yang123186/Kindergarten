//
//  CommentView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "CommentView.h"
#import "General.h"


@implementation CommentView

-(instancetype)init{
    if(self=[super init]){
    }
    return self;
}


-(void)setViewForCommentModal:(SocialCommentModal *)modal{
    NSString *completeStr=[self generateCommentTypeString];
    [self setAttributedStringWithRawText:completeStr];
}


-(NSString*)generateCommentTypeString{
    NSString *aimString=[NSString stringWithFormat:@"\\User:%@/User\\:%@",self.modal.cUserBrief.appellation,self.modal.content];
    return aimString;
}


-(instancetype)initWithSocialCommentModal:(SocialCommentModal *)modal{
    if(self=[self init]){
        [self setViewForCommentModal:modal];
    }
    return self;
}

@end
