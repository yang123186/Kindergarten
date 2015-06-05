//
//  PublishCommentView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/31/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CompleteBlock)(NSString* content);

@interface PublishCommentView : UIView<UITextViewDelegate>

@property   (nonatomic,strong)  UITextView  *textView;
@property   (nonatomic,strong)  UIButton    *sendCommentButton;
@property   (nonatomic,copy)  CompleteBlock   block;

@property   (nonatomic,weak)    UIView      *view;
@property   (nonatomic,assign)  CGFloat     preHeight;

-(instancetype)initWithFrame:(CGRect)frame onView:(UIView*)view;


@end
