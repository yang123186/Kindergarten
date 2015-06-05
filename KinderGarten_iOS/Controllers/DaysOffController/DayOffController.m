//
//  DayOffController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DayOffController.h"
#import "General.h"

static  NSString    *dayOffRequestSuccessStr=@"请假成功";
static  NSString    *dayOffRequestUnknowStr=@"请假不知道成功了没有";
static  NSString    *dayOffRequestFailStr=@"请假失败，请重试";

@interface DayOffController ()

@end

@implementation DayOffController

-(instancetype)init{
    if(self=[super init]){
        self.container=[[DayOffContainer alloc]init];
        self.dayOffStartDate=[NSDate date];
        self.dayOffEndDate=[NSDate date];
        self.dayOffType=LeaveForSick;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[DayOffViewController alloc]initWithRootController:self];
    [self addObserver:self.viewController forKeyPath:observeStartDateKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self.viewController forKeyPath:observeEndDateKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self.viewController forKeyPath:observeTypeKey options:NSKeyValueObservingOptionNew context:nil];
}

-(void)dealloc{
    [self removeObserver:self.viewController forKeyPath:observeStartDateKey];
    [self removeObserver:self.viewController forKeyPath:observeEndDateKey];
    [self removeObserver:self.viewController forKeyPath:observeTypeKey];
}


-(void)commitDayOffRequest{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSDictionary *postInfo=@{@"reason":self.viewController.dayOffReason.textField.text,@"reasonBrief":[self.viewController.dayOffTypeStr objectAtIndex:self.dayOffType],@"beginTime":self.dayOffStartDate.to_yyyy_MM_dd_HH_mm_Style,@"endTime":self.dayOffEndDate.to_yyyy_MM_dd_HH_mm_Style};
    
    
    [manager PUT:DAYOFF_REQUEST_PATH parameters:postInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(operation.response.statusCode==REQUEST_SUCCESS){
            [MBProgressHUD showHUDWithString:dayOffRequestSuccessStr showingTime:defaultTimeInterVal onView:self.view];
        }
        else{
            [MBProgressHUD showHUDWithString:dayOffRequestUnknowStr showingTime:defaultTimeInterVal onView:self.view];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%ldtat Code: li\n%@",(long)operation.response.statusCode,[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        [MBProgressHUD showHUDWithString:dayOffRequestFailStr showingTime:defaultTimeInterVal onView:self.view];
    }];
}

@end
