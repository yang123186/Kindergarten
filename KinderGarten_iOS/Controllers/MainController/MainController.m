//
//  MainController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SuperNavgationController.h"
#import "MainController.h"
#import "General.h"
#import "AppDelegate.h"

#import "MainViewConller.h"
#import "HomeModal.h"
#import "MainGroupButton.h"

#import "PersonalController.h"
#import "HonorListController.h"
#import "SettingController.h"
#import "SocialListController.h"
#import "AttendanceController.h"

static NSString *title=@"主页";

static NSString *observeTopicKey=@"cTopic";

@interface MainController ()

@property   (nonatomic,strong)  MainViewConller *viewController;
@property   (nonatomic,strong)  HomeModal       *modal;

@end

@implementation MainController

#pragma mark Initialize Area
-(instancetype)init{
    if(self=[super init]){
        self.modal=[[HomeModal alloc]init];
        [self.modal addObserver:self forKeyPath:observeTopicKey options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=title;
    self.view.layer.backgroundColor=GRAY_BACKGROUND.CGColor;
    self.viewController=[[MainViewConller alloc]initWithRootController:self];
    [self.viewController createViews];
    self.viewController.childGroupView.delegate=self;
    self.viewController.functionGroupView.delegate=self;
    self.viewController.bottomGroupView.delegate=self;
    [self.viewController.topicView addTarget:self action:@selector(topicViewDidTouched) forControlEvents:UIControlEventTouchUpInside];
    [self getDatafromNetWork];

}


#pragma mark NetWorkArea
-(void)getDatafromNetWork{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager GET:HOME_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        DLog(@"success:%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        DLog(@"get new home info success");
        self.modal=[self.modal initWithDictioary:responseObject];
        [AppDelegate sharedAppDelegate].userModal=self.modal.cUser;
        [self.viewController.topicView.detailLabel setAttributedStringWithRawText:@"haha[亲亲]"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(operation.response.statusCode==AUTHENTICATED_FAIL){
            DLog(@"User login timeout,relogin!");
            LoginController *loginCtrl=[[LoginController alloc]initWithSuperController:self];
            SuperNavgationController *nav=[[SuperNavgationController alloc]initWithRootViewController:loginCtrl];
            [self presentViewController:nav animated:YES completion:nil];
        }
        else{
            DLog(@"MainController:NetWorkfail:%@",error);
        }
    }];
//    NSLog(@"cookies:%@",[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies);
}


#pragma mark Observer Area



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:observeTopicKey]){
        [self.viewController.topicView setTopicViewWithTopicModal:self.modal.cTopic];
    }
}

-(void)dealloc{
    [self.modal removeObserver:self forKeyPath:observeTopicKey];
}


#pragma mark Enevnt Area
-(void)topicViewDidTouched{
    DLog(@"topicView did touched");
    DLog(@"%@",NSStringFromCGSize(self.viewController.scrollView.contentSize));
}


-(void)settingBarButtonTouched{
    SettingController *settingCtrl=[[SettingController alloc]init];
    [self.navigationController pushViewController:settingCtrl animated:YES];
//    NSLog(@"cookies:%@",[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies);
}



#pragma mark Delegate Area

#pragma mark LoginDelegate
-(void)loginSuccess{
    [self getDatafromNetWork];
}

#pragma mark MainGroupViewDelegate
-(void)mainGroupView:(MainGroupView*)mainGroupView buttonDidTouched:(MainGroupButton*)button{
    if(mainGroupView==self.viewController.childGroupView){
        if(button.tag==0){
            PersonalController *personalCtrl=[[PersonalController alloc]initWithStudentModal:nil];
            [self.navigationController pushViewController:personalCtrl animated:YES];
        }
        else if(button.tag==1){
            SocialListController *socialCtrl=[[SocialListController alloc]init];
            [self.navigationController pushViewController:socialCtrl animated:YES];
        }
    }
    if(mainGroupView==self.viewController.functionGroupView){
        if(button.tag==0){
            AttendanceController *attendanceCtrl=[[AttendanceController alloc]init];
            [self.navigationController pushViewController:attendanceCtrl animated:YES];
        }
        else if(button.tag==3){
            HonorListController *honorListCtr=[[HonorListController alloc]init];
            [self.navigationController pushViewController:honorListCtr animated:YES];
        }
    }
}

@end
