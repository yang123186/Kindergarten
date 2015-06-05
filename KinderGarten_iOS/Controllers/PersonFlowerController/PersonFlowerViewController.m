//
//  PersonFlowerViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonFlowerViewController.h"
#import "PersonFlowerController.h"
#import "General.h"
#import "FlowerProgressCell.h"

static const CGFloat    topViewHeight=200.0f;

@implementation PersonFlowerViewController


-(instancetype)initWithRootController:(PersonFlowerController *)controller{
    if (self=[super init]) {
        self.controller=controller;
        self.view=controller.view;
        [self createView];
    }
    return self;
}

-(void)createView{
    self.view.backgroundColor=GRAY_BACKGROUND;
    
    self.tableView=[[UITableView alloc]init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.rowHeight=[FlowerProgressCell height];
    [self.tableView setContentInset:UIEdgeInsetsMake(topViewHeight, 0.0f, 0.0f, 0.0f)];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.topView=[[PersonFlowerTopView alloc]init];
    self.topView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.tableView addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:topViewHeight]);
        make.bottom.equalTo(self.tableView.mas_top);
    }];
}


#pragma mark -UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlowerProgressCell *cell=[[FlowerProgressCell alloc]init];
    return cell;
}








@end
