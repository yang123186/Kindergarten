//
//  MainViewConller.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MainViewConller.h"
#import "General.h"
#import "MainController.h"

static const    CGFloat topImageViewHeight=203.0f;

static NSString *settingBarButonTitle=@"设置";

@implementation MainViewConller

-(instancetype)initWithRootController:(MainController*)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
    }
    return self;
}

-(void)createViews{
    self.iconBarButton=[[MainIconView alloc]initWithImage:[UIImage imageNamed:@"testimg"] onView:self.view delegate:self.controller];
    [self.controller.navigationItem setLeftBarButtonItem:self.iconBarButton];
    
    self.settingBarButton=[[UIBarButtonItem alloc]initWithTitle:settingBarButonTitle style:UIBarButtonItemStylePlain target:self.controller action:@selector(settingBarButtonTouched)];
    [self.controller.navigationItem setRightBarButtonItem:self.settingBarButton];
    
    
    self.topImageView=[[UIImageView alloc]init];
    self.topImageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.topImageView];
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:topImageViewHeight]);
    }];
    
    self.topicView=[[MainTopicView alloc]init];
    self.topicView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.topicView];
    [self.topicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[MainTopicView height]]);
    }];
    
    
    /***********TestArea********/
    [self.topImageView setImage:[UIImage imageNamed:@"testimg"]];
    [self.topicView setTopic:@"今日话题：你会鼓励孩纸吗🐴" detail:@"已有1000+位👪参与了讨论."];
    UIImage *image=[UIImage imageNamed:@"testimg"];
    NSArray *icons=[NSArray arrayWithObjects:image,image,image,image,image,image,image,image,image,image,image,image, nil];
    NSString *teststr=@"测试字符";
    NSArray *titles=[NSArray arrayWithObjects:teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr, nil];
    /***********TestArea********/
    
    
    self.childGroupView=[[MainGroupView alloc]initWithItemNumer:3 icons:icons titles:titles];
    self.childGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.childGroupView];
    [self.childGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.childGroupView height]]);
    }];
    
    self.functionGroupView=[[MainGroupView alloc]initWithItemNumer:7 icons:icons titles:titles];
    self.functionGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.functionGroupView];
    [self.functionGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.childGroupView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.functionGroupView height]]);
    }];
    
    self.bottomGroupView=[[MainGroupView alloc]initWithItemNumer:3 icons:icons titles:titles];
    self.bottomGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.bottomGroupView];
    [self.bottomGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.functionGroupView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.bottomGroupView height]]);
    }];
    
}

@end
