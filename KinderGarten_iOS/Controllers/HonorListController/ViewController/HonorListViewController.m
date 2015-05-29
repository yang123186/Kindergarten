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
#import "FlowerCell.h"


@interface HonorListViewController()

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


-(void)createSubView{
        
    self.tableView=[[UITableView alloc]init];
    self.tableView.hidden=YES;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.allowsSelection=NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.controller.topButton.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-sendFlowerButtonHeight);
    }];
    
    
}


#pragma mark KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:observeTodayContainerKey]){
        [self.tableView reloadData];
    }
}


#pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controller.todayContainer.container.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FlowerCell *cell=[tableView dequeueReusableCellWithIdentifier:FlowerCellIdentifier];
    if(!cell){
        cell=[[FlowerCell alloc]init];
    }
    [cell setViewForModal:[self.controller.todayContainer modalAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [FlowerCell height];
}

@end
