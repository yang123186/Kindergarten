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
    
    self.topView=[[WeekTopView alloc]initWithDefaultDay:self.controller.defaultDate.dayInWeek];
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
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
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
    
    self.bottomView=[[BottomCalendarView alloc]init];
    self.bottomView.achiever=self.controller;
    self.bottomView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo([NSNumber numberWithDouble:[BottomCalendarView height]]);
    }];
    
}


-(void)calendarShoulShow{
    self.datePickerView=[[DatePickerView alloc]init];
    [self.datePickerView.picker setDatePickerMode:UIDatePickerModeDate];
    [self.datePickerView.picker setMinimumDate:[NSDate dateWithTimeIntervalSince1970:0.0]];
    self.datePickerView.delegate=self;
    self.datePickerView.frame=CGRectMake(0, [Screen height]-[DatePickerView height], [Screen width], [DatePickerView height]);
    [self.view addSubview:self.datePickerView];
}


-(void)dateChoosedWithDate:(NSDate*)date{
    [self.controller selectedDate:self.datePickerView.picker.date];
    DLog(@"offset :%li",(long)[date dayNumberFromNow]);
    [self.datePickerView removeFromSuperview];
    self.datePickerView=nil;
}

-(void)cancelButtonTouched{
    [self.datePickerView removeFromSuperview];
    self.datePickerView=nil;

}




#pragma mark TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controller.modal.cMeals.container.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipeCell *cell=[tableView dequeueReusableCellWithIdentifier:RecipeCellIdentifier];
    if(!cell){
        cell=[[RecipeCell alloc]init];
    }
    [cell setViewForModal:[self.controller.modal.cMeals modalAtIndex:indexPath.row]];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
#warning Need picture in modal!
    return [RecipeCell heightWithPicNumber:1];
}


@end
