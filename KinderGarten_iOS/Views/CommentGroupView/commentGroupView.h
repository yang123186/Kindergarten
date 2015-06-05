//
//  commentGroupView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialCommentContainer.h"
#import "CommentView.h"

@interface CommentGroupView : UIView

@property   (nonatomic,strong)  NSMutableArray  *comments;

@property   (nonatomic,assign,readonly) CGFloat height;

-(instancetype)init;

-(void)setViewForCommentsContainer:(SocialCommentContainer*)container;

-(instancetype)initWithCommentsContainer:(SocialCommentContainer*)container;

@end
