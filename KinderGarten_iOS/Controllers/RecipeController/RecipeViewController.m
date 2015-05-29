//
//  RecipeViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipeController.h"
#import "General.h"
#import "RecipeCell.h"

static NSString*  const title=@"今日食谱";

@implementation RecipeViewController

-(instancetype)initWithRootController:(RecipeController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createView];
    }
    return self;
}

-(void)createView{
    self.controller.title=title;
    
    self.topView=[[WeekTopView alloc]initWithDefaultDay:2];
    [self.topView setBackgroundColor:PINK_COLOR];
    self.topView.delegate=self.controller;
//    [self.topView setBackgroundColor:PINK_COLOR];
    self.topView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[WeekTopView height]]);
    }];
    
    
    self.tableView=[[UITableView alloc]init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset([WeekTopView height]);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipeCell *cell=[[RecipeCell alloc]init];
    return cell;
    
}


@end
