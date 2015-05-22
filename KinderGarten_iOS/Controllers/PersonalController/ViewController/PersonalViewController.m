//
//  PersonalViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalController.h"
#import "General.h"

static const    CGFloat iconEdgeLength=100.0f;
static const    CGFloat headerViewHeight=20.0f;
static NSString *personalTableViewCellReuseIdentifier=@"PERSONAL_CELL";

@interface  PersonalViewController()
@property   (nonatomic,strong)  NSArray *childInfoTitleArray;
@property   (nonatomic,strong)  NSArray *functionTitleArray;
@property   (nonatomic,strong)  NSArray *familyTitleArray;

@property   (nonatomic,strong)  NSArray *titleArray;

@property   (nonatomic,strong)  UIImageView *icon;

@end


@implementation PersonalViewController

-(instancetype)initWithRootController:(PersonalController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    self.childInfoTitleArray=[NSArray arrayWithObjects:@"姓名",@"小名",@"英文名",@"生日",@"年龄", nil];
    self.functionTitleArray=[NSArray arrayWithObjects:@"行为指导记录",@"出勤记录", nil];
    self.familyTitleArray=[NSArray arrayWithObjects:@"爸爸",@"妈妈",@"爷爷",@"奶奶",@"外公",@"外婆",@"其他",@"其他", nil];
    
    self.titleArray=[NSArray arrayWithObjects:self.childInfoTitleArray,self.functionTitleArray,self.familyTitleArray, nil];
    
    self.tableView=[[UITableView alloc]initWithFrame:[Screen bounds] style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    self.tableView.separatorColor=PINK_COLOR;
    
    self.tableView.contentInset=UIEdgeInsetsMake(iconEdgeLength+headerViewHeight, 0.0f, 0.0f, 0.0f);
    self.icon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"20131220222849-1195882039"]];
    self.icon.translatesAutoresizingMaskIntoConstraints=NO;
    [self.tableView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_top).with.offset(-iconEdgeLength);
        make.centerX.equalTo(self.tableView.mas_centerX);
        make.height.equalTo([NSNumber numberWithDouble:iconEdgeLength]);
        make.width.equalTo([NSNumber numberWithDouble:iconEdgeLength]);
    }];
    [self.icon setCircleRadius:iconEdgeLength/2];
}

#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray*)[self.titleArray objectAtIndex:section]).count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:personalTableViewCellReuseIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalTableViewCellReuseIdentifier];
    }
    [cell.textLabel setText:[[self.titleArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return headerViewHeight;
}


@end
