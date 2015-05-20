//
//  MainController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SuperNavgationController.h"
#import "MainController.h"
#import "LoginController.h"

static NSString *title=@"主页";


@interface MainController ()

@end

@implementation MainController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=title;

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(YES){
        LoginController *loginCtrl=[[LoginController alloc]init];
        SuperNavgationController *nav=[[SuperNavgationController alloc]initWithRootViewController:loginCtrl];
        [self presentViewController:nav animated:NO completion:nil];
    }
}



@end
