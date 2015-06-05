//
//  HonorListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "HonorListController.h"

@implementation HonorListController


-(instancetype)init{
    if(self=[super init]){
        
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.viewController=[[HonorListViewController alloc]initWithRootController:self];
    
}

@end
