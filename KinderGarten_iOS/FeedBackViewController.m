//
//  FeedBackViewController.m
//  KinderGarten_iOS
//
//  Created by 杨容清 on 15/6/4.
//  Copyright (c) 2015年 Rdd7. All rights reserved.
//
//#import <QuartzCore/QuartzCore.h>
#import "FeedBackViewController.h"
#import "FeedBackController.h"
#import "General.h"


static  const   NSString *title = @"意见反馈";
static  const   CGFloat marginVertical=2.5f;
static  const   CGFloat textViewHeight=150.0f;
static  const   CGFloat textLeft = 15.0f;
static  const   CGFloat textRight = -15.0f;
static  const   CGFloat textTop = 10.0f;
static  const   CGFloat textHeight = 40.0f;
static  const   NSString *feedBackTitle = @"请写下使用过程中遇到的问题";
static  const   NSString *OKbuttonImageName=@"nav_OK";


@implementation FeedBackViewController

-(instancetype)initWithRootController:(FeedBackController *)rootController{
    if(self = [super init]){
        self.rootController = rootController;
        self.view = rootController.view;
        [self createSubView];
    }
    return self;
}


-(void)createSubView{
    [self.view setBackgroundColor:GRAY_BACKGROUND];
    self.feedBackView = [[UITextView alloc] init];
    self.rootController.title = title;
    
    self.title = [[UILabel alloc] init];
    self.title.text = feedBackTitle;
    self.title.font = [UIFont systemFontOfSize:18];
    
    self.feedBackView.layer.borderWidth = 0.5;

    
    [self.view addSubview:self.feedBackView];
    [self.view addSubview:self.title];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view.mas_top);
        make.top.equalTo(self.view.mas_top).with.offset(marginVertical);
        make.height.equalTo([NSNumber numberWithDouble:textHeight]);
        make.left.equalTo(self.view.mas_left).with.offset(textLeft);
        make.right.equalTo(self.view.mas_right).with.offset(textRight);
    }];
    
    [self.feedBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).with.offset(textTop);
        make.height.equalTo([NSNumber numberWithDouble:textViewHeight]);
        make.left.equalTo(self.view.mas_left ).with.offset(textLeft);
        make.right.equalTo(self.view.mas_right ).with.offset(textRight);
    }];
    
    
    self.OKbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:OKbuttonImageName] style:UIBarButtonItemStylePlain target:self.rootController action:@selector(getFeedBackMessage)];
    [self.rootController.navigationItem setRightBarButtonItem:self.OKbutton];

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
