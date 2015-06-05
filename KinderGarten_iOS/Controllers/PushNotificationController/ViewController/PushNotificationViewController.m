//
//  PushNotificationViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PushNotificationViewController.h"
#import "PushNotificationController.h"
#import "General.h"
#import "AppDelegate.h"

static NSString *title=@"推送设置";

static NSString *theNewMessageCellTitle=@"新消息";
static NSString *theNewMessageTimeDurationCellTitle=@"新消息时段";
static NSString *notifySoundCellTitle=@"声音";
static NSString *shakeCellTitle=@"震动";



static NSString *theNewMessageTimeDurationCellReuseIdentifier=@"THE_NEW_MESSAGE_DURATION_CELL";


@interface PushNotificationViewController ()

@property   (strong,nonatomic)  NSArray *cellsTitle;
@property   (strong,nonatomic)  NSArray *cells;

@property   (strong,nonatomic)  SwitchCell  *theNewMessageCell;
@property   (strong,nonatomic)  UITableViewCell *theNewMessageDurationCell;
@property   (strong,nonatomic)  SwitchCell  *notifySoundCell;
@property   (strong,nonatomic)  SwitchCell  *shakeCell;


@end


@implementation PushNotificationViewController


-(instancetype)initWithRootController:(PushNotificationController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        self.cellsTitle=[NSArray arrayWithObjects:theNewMessageCellTitle,theNewMessageTimeDurationCellTitle,notifySoundCellTitle,shakeCellTitle, nil];
        
        [self subViewCreate];
    }
    return self;
}

-(void)subViewCreate{
    self.controller.title=title;
    
    self.tableView=[[UITableView alloc]init];
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
    
    
    self.theNewMessageCell=[[SwitchCell alloc]initWithDefaultSwitchStatus:self.controller.modal.pushMessageSwitch];
    self.theNewMessageCell.delegate=self.controller;
    self.theNewMessageDurationCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theNewMessageTimeDurationCellReuseIdentifier];
    self.notifySoundCell=[[SwitchCell alloc]initWithDefaultSwitchStatus:self.controller.modal.pushMessageSoundSwitch];
    self.notifySoundCell.delegate=self.controller;
    self.shakeCell=[[SwitchCell alloc]initWithDefaultSwitchStatus:self.controller.modal.pushMessageShakeSwitch];
    self.shakeCell.delegate=self.controller;
    self.cells=[NSArray arrayWithObjects:self.theNewMessageCell,self.theNewMessageDurationCell,self.notifySoundCell,self.shakeCell, nil];
    
}


#pragma mark UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellsTitle.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[self.cells objectAtIndex:indexPath.row];
    [cell.textLabel setText:[self.cellsTitle objectAtIndex:indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1){
        [self.controller showTimeDuration];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
