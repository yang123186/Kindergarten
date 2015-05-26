//
//  DayOffViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DayOffViewController.h"
#import "DayOffController.h"
#import "General.h"

static const    CGFloat commonCellHeight=44.0f;
static  const   CGFloat reasonTextHeight=151.0f;

static const    NSInteger numberOfTableViewSection=3;
static const    NSInteger sectionDateChoose=0;
static const    NSInteger sectionDayOffReason=1;
static const    NSInteger sectionDayOffHistory=2;


static NSString *dayOffHisCellIdentifier=@"DayOffHisCell";


@interface DayOffViewController()

@property   (nonatomic,strong)  NSArray *dayOffTypeStr;

@end

@implementation DayOffViewController

-(instancetype)initWithRootController:(DayOffController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        self.dayOffTypeStr=[NSArray arrayWithObjects:@"病假",@"事假" ,nil];
        [self createSubView];
    }
    return self;
}

-(void)createSubView{
    
    self.dayOffStartCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.dayOffEndCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.dayOffTypeCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.dayOffReason=[[TextViewCell alloc]init];
    
    
    self.tableView=[[UITableView alloc]initWithFrame:[Screen bounds] style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorColor=PINK_COLOR;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    

    UIBarButtonItem *commitButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_OK"] style:UIBarButtonItemStylePlain target:self.controller action:@selector(commitDayOffRequest)];
    [self.controller.navigationItem setRightBarButtonItem:commitButton];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return numberOfTableViewSection;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case sectionDateChoose:
            return 2;
            break;
        case sectionDayOffReason:
            return 2;
        case sectionDayOffHistory:
            return self.controller.container.container.count;
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==sectionDayOffReason && indexPath.row==1){
        return reasonTextHeight;
    }
    else{
        return commonCellHeight;
    }
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case sectionDateChoose:{
            if(indexPath.row==0){
                cell=self.dayOffStartCell;
            }
            else{
                cell=self.dayOffEndCell;
            }
        }
            break;
        
        case sectionDayOffReason:{
            if(indexPath.row==0){
                cell=self.dayOffTypeCell;
            }
            else{
                cell=self.dayOffReason;
            }
        }
            break;
        
        case sectionDayOffHistory:{
            cell=[tableView dequeueReusableCellWithIdentifier:dayOffHisCellIdentifier];
            if(!cell){
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dayOffHisCellIdentifier];
            }
        }
            break;
            
            
        default:
            cell=nil;
            break;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case sectionDateChoose:{
            if(indexPath.row==0){
                [cell.textLabel setText:[NSString stringWithFormat:@"起始日期: %@",self.controller.dayOffStartDate.to_yyyy_MM_dd_HH_mm_Style]];
            }
            else{
                [cell.textLabel setText:[NSString stringWithFormat:@"结束日期: %@",self.controller.dayOffEndDate.to_yyyy_MM_dd_HH_mm_Style]];
            }
        }
            break;
            
        case sectionDayOffReason:{
            if(indexPath.row==0){
                [cell.textLabel setText:[NSString stringWithFormat:@"请假类型: %@",[self.dayOffTypeStr objectAtIndex:self.controller.dayOffType]]];

            }
        }
            break;
            
        case sectionDayOffHistory:{
            [cell.textLabel setText:[self.controller.container modalAtIndex:indexPath.row].briefReason];
            [cell.detailTextLabel setText:[self.controller.container modalAtIndex:indexPath.row].beginTime];
        }
            break;
    }

}


@end
