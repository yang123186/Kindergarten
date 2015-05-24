//
//  HonorListViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "HonorListViewController.h"
#import "HonorListController.h"
#import "General.h"


static const    NSUInteger  titleNumber=3;

@interface HonorListViewController()

@property   (nonatomic,strong)  NavigationTopButton *topButton;
@property   (nonatomic,strong)  NSArray             *topButtonTitles;

@end


@implementation HonorListViewController

-(instancetype)initWithRootController:(HonorListController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createSubView];
    }
    return self;
}

-(void)buttonTouchedAtIndex:(NSUInteger)index{
    
}

-(void)createSubView{
    self.topButtonTitles=[NSArray arrayWithObjects:@"今天",@"本周",@"本月" ,nil];
    self.topButton=[[NavigationTopButton alloc]initWithButtonNumber:titleNumber];
    self.topButton.delegate=self;
    [self.topButton setTitlesWithArray:self.topButtonTitles];
    [self.view addSubview:self.topButton];
    self.topButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[NavigationTopButton height]]);
    }];
}


@end
