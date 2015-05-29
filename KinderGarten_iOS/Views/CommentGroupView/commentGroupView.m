//
//  commentGroupView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "commentGroupView.h"
#import "General.h"

@implementation CommentGroupView

-(instancetype)init{
    if(self=[super init]){
        self.comments=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}


-(void)setViewForCommentsContainer:(SocialCommentContainer*)container{
    for (CommentLabel *commentLabel in self.comments) {
        if(commentLabel.superview){
            [commentLabel removeFromSuperview];
        }
    }
    [self.comments removeAllObjects];
    
    UIView *preView=nil;
    for(SocialCommentModal *modal in container.aComments){
        CommentLabel *commentLabel=[[CommentLabel alloc]init];
        [commentLabel setViewForModal:modal];
        [self.comments addObject:commentLabel];
        commentLabel.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:commentLabel];
        [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if(preView){
                make.top.equalTo(preView.mas_bottom);
            }
            else{
                make.top.equalTo(self.mas_top);
            }
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            if(modal ==container.aComments.lastObject){
                make.bottom.equalTo(self.mas_bottom);
            }
            else{
                make.height.equalTo(commentLabel.mas_height);
            }
        }];
        preView=commentLabel;
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
//    [self layoutIfNeeded];
}


-(instancetype)initWithCommentsContainer:(SocialCommentContainer *)container{
    if(self=[super init]){
        if(!self.comments){
            self.comments=[[NSMutableArray alloc]initWithCapacity:0];
        }
        else{
            [self.comments removeAllObjects];
        }
        [self setViewForCommentsContainer:container];
    }
    return self;
}

@end
