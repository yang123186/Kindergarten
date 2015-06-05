//
//  AttendanceDetailController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceDetailController.h"
#import "General.h"

static const    CGFloat imageViewPaddingTop=10.0f;
static const    CGFloat marginVertical=15.0f;
static  const   CGFloat paddingHorizontal=10.0f;

static const    CGFloat imageViewHeight=191.0f;
static  const   CGFloat cellHeight=40.0f;

static const    CGFloat circleRadius=5.0f;

static NSString *attendanceSourceTitle=@"签到来源";
static NSString *attendanceDateTitle=@"签到时间";
static NSString *title=@"签到详情";

@interface AttendanceDetailController ()

@end

@implementation AttendanceDetailController


-(instancetype)initWithModal:(AttendanceIndex *)modal{
    if(self=[super init]){
        self.modal=modal;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=title;
    self.view.backgroundColor=GRAY_BACKGROUND;
    
    self.imageView=[[UIImageView alloc]init];
    [self.imageView setCircleRadius:circleRadius];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(imageViewPaddingTop);
        make.left.equalTo(self.view.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.view.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:imageViewHeight]);
    }];
    
    self.attendanceSourceLabel=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    [self.attendanceSourceLabel setCircleRadius:circleRadius];
    [self.attendanceSourceLabel.detailTextLabel setTextColor:BLACK_COLOR];
    [self.attendanceSourceLabel.textLabel setText:attendanceSourceTitle];
    self.attendanceSourceLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.attendanceSourceLabel];
    [self.attendanceSourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(marginVertical);
        make.left.equalTo(self.view.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.view.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:cellHeight]);
    }];
    
    
    
    self.attendanceDateLabel=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    [self.attendanceDateLabel setCircleRadius:circleRadius];
    [self.attendanceDateLabel.detailTextLabel setTextColor:BLACK_COLOR];
    [self.attendanceDateLabel.textLabel setText:attendanceDateTitle];
    self.attendanceDateLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.attendanceDateLabel];
    [self.attendanceDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.attendanceSourceLabel.mas_bottom).with.offset(marginVertical);
        make.left.equalTo(self.view.mas_left).with.offset(paddingHorizontal);
        make.right.equalTo(self.view.mas_right).with.offset(-paddingHorizontal);
        make.height.equalTo([NSNumber numberWithDouble:cellHeight]);
    }];
    
    if(self.modal){
        [self setViewForSelfModal];
    }
    
}

-(void)setViewForModal:(AttendanceIndex*)modal{
    [self.imageView setImageWithURL:[NSURL URLWithString:modal.picture]];
    [self.attendanceSourceLabel.detailTextLabel setText:modal.signInSource];
    [self.attendanceDateLabel.detailTextLabel setText:[NSString stringWithFormat:@"%@ %@",modal.datePreFix,modal.arriveTime]];
}

-(void)setViewForSelfModal{
    [self setViewForModal:self.modal];
}

@end
