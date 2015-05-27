//
//  AttendanceViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceViewController.h"
#import "AttendanceController.h"
#import "General.h"
#import "AttendanceCell.h"

static NSString *title=@"签到";

static const CGFloat    tableViewPaddingHorizontal=10.0f;

@implementation AttendanceViewController

-(instancetype)initWithRootController:(AttendanceController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createSubViews];
    }
    return self;
}


-(void)createSubViews{
    self.controller.title=title;
    
    self.tableView=[[UITableView alloc]initWithFrame:[Screen bounds] style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.layer.backgroundColor=GRAY_BACKGROUND.CGColor;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
//    self.tableView.contentInset=UIEdgeInsetsMake(0.0, tableViewPaddingHorizontal, 0.0f, tableViewPaddingHorizontal);

}

#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controller.container.container.count;
//    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AttendanceCell *cell=[[AttendanceCell alloc]init];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [AttendanceCell height];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.controller didSelectedItemAtIndex:indexPath.row];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
