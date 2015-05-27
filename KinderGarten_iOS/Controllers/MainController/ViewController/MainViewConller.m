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

@interface MainViewConller ()

@property   (nonatomic,strong)  UIView          *contentView;

@property   (nonatomic,strong)  NSArray         *childGroupTitles;
@property   (nonatomic,strong)  NSArray         *functionGroupTitles;
@property   (nonatomic,strong)  NSArray         *bottomGroupTitles;

@end




@implementation MainViewConller

-(instancetype)initWithRootController:(MainController*)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        self.childGroupTitles=[NSArray arrayWithObjects:@"XXX",@"家长圈",@"消息", nil];
        self.functionGroupTitles=[NSArray arrayWithObjects:@"签到",@"请假",@"作业",@"红花榜",@"课程表",@"行为指导",@"今日食谱", nil];
        self.bottomGroupTitles=[NSArray arrayWithObjects:@"评价老师",@"通知公告",@"投诉与建议", nil];
    }
    return self;
}

-(void)createViews{
    self.contentView=[[UIView alloc]init];
    
    self.iconBarButton=[[MainIconView alloc]initWithImage:[UIImage imageNamed:@"xiaoye"] onView:self.view delegate:self.controller];
    [self.controller.navigationItem setLeftBarButtonItem:self.iconBarButton];
    
    self.settingBarButton=[[UIBarButtonItem alloc]initWithTitle:settingBarButonTitle style:UIBarButtonItemStylePlain target:self.controller action:@selector(settingBarButtonTouched)];
    [self.controller.navigationItem setRightBarButtonItem:self.settingBarButton];
    
    
    self.topImageView=[[UIImageView alloc]init];
    self.topImageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.topImageView];
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:topImageViewHeight]);
    }];
    
    self.topicView=[[MainTopicView alloc]init];
    self.topicView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.topicView];
    [self.topicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[MainTopicView height]]);
    }];
    
    
    /***********TestArea********/
    [self.topImageView setImage:[UIImage imageNamed:@"xiaoye"]];
    [self.topicView setTopic:@"今日话题：你会鼓励孩纸吗🐴" detail:@"已有1000+位👪参与了讨论."];
    UIImage *image=[UIImage imageNamed:@"xiaoye"];
    NSArray *icons=[NSArray arrayWithObjects:image,image,image,image,image,image,image,image,image,image,image,image, nil];
//    NSString *teststr=@"测试字符";
//    NSArray *titles=[NSArray arrayWithObjects:@"韩小野",@"签到",@"请假",teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr,teststr, nil];
    /***********TestArea********/
    
    
    self.childGroupView=[[MainGroupView alloc]initWithItemNumer:3 icons:icons titles:self.childGroupTitles];
    self.childGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.childGroupView];
    [self.childGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.childGroupView height]]);
    }];
    self.childGroupView.delegate=self.controller;
    
    self.functionGroupView=[[MainGroupView alloc]initWithItemNumer:7 icons:icons titles:self.functionGroupTitles];
    self.functionGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.functionGroupView];
    [self.functionGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.childGroupView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.functionGroupView height]]);
    }];
    self.functionGroupView.delegate=self.controller;
    
    self.bottomGroupView=[[MainGroupView alloc]initWithItemNumer:3 icons:icons titles:self.bottomGroupTitles];
    self.bottomGroupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.bottomGroupView];
    [self.bottomGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.functionGroupView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[self.bottomGroupView height]]);
    }];
    self.bottomGroupView.delegate=self.controller;
    
    
    self.scrollView=[[UIScrollView   alloc]init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    
    self.contentView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, topImageViewHeight+[MainTopicView height]+[self.childGroupView height]+[self.functionGroupView height]+[self.bottomGroupView height]);
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize=self.contentView.frame.size;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.showsHorizontalScrollIndicator=NO;
//    self.scrollView.bounces=NO;
}

@end
