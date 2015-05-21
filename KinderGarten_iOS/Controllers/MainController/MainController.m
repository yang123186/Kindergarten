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
#import "General.h"

#import "MainViewConller.h"

static NSString *title=@"主页";


@interface MainController ()

@property   (nonatomic,strong)  MainViewConller *viewController;

@end

@implementation MainController

-(instancetype)init{
    if(self=[super init]){
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=title;
    self.view.layer.backgroundColor=BACKGROUND_GRAY.CGColor;
    self.viewController=[[MainViewConller alloc]initWithRootController:self];
    [self.viewController createViews];
    self.viewController.childGroupView.delegate=self;
    self.viewController.functionGroupView.delegate=self;
    self.viewController.bottomGroupView.delegate=self;
    [self.viewController.topicView addTarget:self action:@selector(topicViewDidTouched) forControlEvents:UIControlEventTouchUpInside];

    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager GET:HOME_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"success:%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"fail:%@",error);
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    if(NO){
//        LoginController *loginCtrl=[[LoginController alloc]init];
//        SuperNavgationController *nav=[[SuperNavgationController alloc]initWithRootViewController:loginCtrl];
//        [self presentViewController:nav animated:NO completion:nil];
//    }
}




#pragma mark---------Enevnt Area----------
-(void)topicViewDidTouched{
    
}


-(void)settingBarButtonTouched{
    
}

#pragma mark -MainGroupViewDelegate
-(void)mainGroupView:(MainGroupView*)mainGroupView buttonDidTouched:(MainGroupButton*)button{
    
}


@end
