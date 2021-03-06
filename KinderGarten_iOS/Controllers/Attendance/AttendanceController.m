//
//  AttendanceController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AttendanceController.h"
#import "General.h"
#import "AttendanceDetailController.h"

static NSString* const observeContainerKey=@"container";
static NSString* const observeManagerKey=@"manager";

@interface AttendanceController ()

@end

@implementation AttendanceController

-(instancetype)init{
    if(self=[super init]){
        self.container=[[AttendanceContainer alloc]init];
        self.manager=[[AttendanceManager alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[AttendanceViewController alloc]initWithRootController:self];
    [self addObserver:self forKeyPath:observeContainerKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:observeManagerKey options:NSKeyValueObservingOptionNew context:nil];
    [self requestData];
}


-(void)didSelectedItemAtIndex:(NSInteger)index{
    AttendanceDetailController *attendanceDetailCtrl=[[AttendanceDetailController alloc]initWithModal:[self.manager modalAtIndex:index]];
    [self.navigationController pushViewController:attendanceDetailCtrl animated:YES];
}

#pragma mark KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:observeManagerKey]){
        [self.viewController.tableView reloadData];
    }
    else if([keyPath isEqualToString:observeContainerKey]){
        self.manager=[self.manager initWithContainer:self.container];
    }
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:observeContainerKey];
    [self removeObserver:self forKeyPath:observeManagerKey];
}



#pragma mark NetWork
-(void)requestData{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    NSNumber *sec=[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    sec=[NSNumber numberWithInteger:sec.integerValue];
    DLog(@"%@",sec.stringValue);
    [manager GET:@"http://1.r7test.sinaapp.com/att.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

//    [manager GET:ATTENDANCE_LIST_PATH(sec.stringValue) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        self.container=[self.container initWithArray:[responseObject objectForKey:@"attendances"]];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        DLog(@"errorCode:%li\nDetail:%@",(long)operation.response.statusCode,[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]
            );
        
    }];
}

@end
