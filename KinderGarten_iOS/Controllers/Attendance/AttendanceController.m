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

static NSString *observeContainerKey=@"container";

@interface AttendanceController ()

@end

@implementation AttendanceController

-(instancetype)init{
    if(self=[super init]){
        self.container=[[AttendanceContainer alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[AttendanceViewController alloc]initWithRootController:self];
    [self addObserver:self forKeyPath:observeContainerKey options:NSKeyValueObservingOptionNew context:nil];
    [self requestData];
}


-(void)didSelectedItemAtIndex:(NSInteger)index{
    AttendanceDetailController *attendanceDetailCtrl=[[AttendanceDetailController alloc]initWithModal:[self.container modalAtIndexl:index]];
    [self.navigationController pushViewController:attendanceDetailCtrl animated:YES];
}

#pragma mark KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:observeContainerKey]){
        
    }
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:observeContainerKey];
}



#pragma mark NetWork
-(void)requestData{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager GET:ATTENDANCE_LIST_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        DLog(@"errorCode:%li\nDetail:%@",(long)operation.response.statusCode,[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]
            );
        
    }];
}

@end
