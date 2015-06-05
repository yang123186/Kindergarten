//
//  CommentView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialListModal.h"

@interface CommentView : UILabel

@property   (nonatomic,assign,readonly) CGFloat height;
@property   (nonatomic,weak)    SocialCommentModal* modal;

-(instancetype)init;
-(void)setViewForCommentModal:(SocialCommentModal*)modal;
-(instancetype)initWithSocialCommentModal:(SocialCommentModal*)modal;

@end
