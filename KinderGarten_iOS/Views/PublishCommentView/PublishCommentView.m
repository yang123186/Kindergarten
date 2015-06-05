//
//  PublishCommentView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/31/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PublishCommentView.h"
#import "General.h"

static NSString*    const   sendButtonTitle=@"发送";

static const    CGFloat paddingVertical=10.0f;
static const    CGFloat paddingHorizontal=5.0f;
static const    CGFloat buttonWidth=50.0f;
static const    CGFloat buttonHeight=30.0f;

@implementation PublishCommentView

-(instancetype)initWithFrame:(CGRect)frame onView:(UIView *)view{
    if (self=[super initWithFrame:frame]) {
        self.view=view;
        [self createViews];
    }
    return self;
}


-(void)createViews{
    [self setBackgroundColor:BLACK_COLOR];
    
    
    self.sendCommentButton=[[UIButton alloc]init];
    [self.sendCommentButton addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    self.sendCommentButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.sendCommentButton setBackgroundColor:PINK_COLOR];
    [self.sendCommentButton setTitle:sendButtonTitle forState:UIControlStateNormal];
    [self addSubview: self.sendCommentButton];
    [self.sendCommentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo([NSNumber numberWithDouble:buttonHeight]);
        make.bottom.equalTo(self.mas_bottom).with.offset(-paddingVertical);
        make.right.equalTo(self.mas_right).with.offset(-paddingHorizontal);
        make.width.equalTo([NSNumber numberWithDouble:buttonWidth]);
    }];
    
    self.textView=[[UITextView alloc]init];
    self.textView.delegate=self;
    self.textView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(paddingHorizontal);
        make.top.equalTo(self.mas_top).with.offset(paddingVertical);
        make.bottom.equalTo(self.mas_bottom).with.offset(-paddingVertical);
        make.right.equalTo(self.sendCommentButton.mas_left).with.offset(-paddingHorizontal);
    }];
    self.preHeight=self.textView.contentSize.height;
}


- (void)textViewDidChange:(UITextView *)textView{
    CGRect orgFrame=self.frame;
//    if(self.textView.contentSize.height<minHeight){
//        self.textView.contentSize.height=minHeight;
//    }
    
    CGFloat different=self.preHeight-self.textView.contentSize.height;
    orgFrame.origin.y+=different;
    orgFrame.size.height-=different;
    self.preHeight=self.textView.contentSize.height;
//    if(self.textView.contentSize.height<minHeight){
//        orgFrame.origin.y+=orgFrame.size.height-minHeight;
//        orgFrame.size.height=minHeight;
//    }
//    else{
//        orgFrame.origin.y+=orgFrame.size.height-self.textView.contentSize.height;
//        orgFrame.size.height=self.textView.contentSize.height;
//    }
    self.frame=orgFrame;
}


-(void)commit{
    self.block(self.textView.text);
}

@end
