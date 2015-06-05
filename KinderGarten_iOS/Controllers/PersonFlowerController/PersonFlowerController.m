//
//  PersonFlowerController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PersonFlowerController.h"
#import "General.h"


@interface PersonFlowerController ()

@end

@implementation PersonFlowerController

-(instancetype)initWithStudentId:(NSString *)studentId{
    if (self=[super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewController=[[PersonFlowerViewController alloc]initWithRootController:self];
    
}


-(void)requestStudentFlowerData{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
//    manager GET:<#(NSString *)#> parameters:<#(id)#> success:<#^(AFHTTPRequestOperation *operation, id responseObject)success#> failure:<#^(AFHTTPRequestOperation *operation, NSError *error)failure#>
    
}

@end
