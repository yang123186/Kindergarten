//
//  SettingViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingController.h"
#import "General.h"

static const    CGFloat logoutButtonHeight=40.0f;
static const    CGFloat logoutButtonFontSize=18.0f;


static NSString *reuseCellIdentifier=@"SETTING_TABLEVIEW_CELL";

static  NSString    *modifyPasswordTitle=@"修改密码";
static  NSString    *pushNotificationTitle=@"推送设置";
static  NSString    *systemMessageTitle=@"系统消息";
static  NSString    *feedbackTitle=@"意见反馈";
static  NSString    *aboutUsTitle=@"关于我们";
static  NSString    *checkUpdateTitle=@"检查更新";

static NSString *logoutButtonTitle=@"退出登录";


static  const   NSInteger   sectionFunction=0;
static  const   NSInteger   sectionEtc=1;

static  const   NSInteger   rowModifyPassword=0;
static  const   NSInteger   rowPushNotification=1;
static  const   NSInteger   rowSystemMessage=2;

static  const   NSInteger   rowFeedback=0;
static  const   NSInteger   rowAboutUs=1;
static  const   NSInteger   rowCheckUpdate=2;


@interface SettingViewController()

@property   (nonatomic,weak)    UIView  *superView;
@property   (nonatomic,strong)  NSArray *settingCells;

@end

@implementation SettingViewController

-(instancetype)initWithSuperController:(SettingController *)superController{
    if(self=[super init]){
        self.superController=superController;
        self.superView=superController.view;
        self.tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        self.logoutButton=[[UIButton alloc]init];
    }
    return self;
}



-(void)createViews{
    NSArray *functionCells=[NSArray arrayWithObjects:modifyPasswordTitle,pushNotificationTitle,systemMessageTitle,nil];
    NSArray *etcCells=[NSArray arrayWithObjects:feedbackTitle,aboutUsTitle,checkUpdateTitle, nil];
    self.settingCells=[NSArray arrayWithObjects:functionCells,etcCells,nil];
    
    [UITableViewCell appearance].accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    [UITableViewCell appearance].tintColor=PINK_COLOR;
    
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.superView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superView.mas_top);
        make.bottom.equalTo(self.superView.mas_bottom);
        make.left.equalTo(self.superView.mas_left);
        make.right.equalTo(self.superView.mas_right);

    }];
    
    self.logoutButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.superView addSubview:self.logoutButton];
    [self.logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.superView.mas_bottom);
        make.height.equalTo([NSNumber numberWithDouble:logoutButtonHeight]);
        make.left.equalTo(self.superView.mas_left);
        make.right.equalTo(self.superView.mas_right);
    }];
    
    [self.tableView setSeparatorColor:PINK_COLOR];
    
    [self.logoutButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.logoutButton setBackgroundColor:PINK_COLOR];
    [self.logoutButton setTitle:logoutButtonTitle forState:UIControlStateNormal];
    [self.logoutButton.titleLabel setFont:[UIFont systemFontOfSize:logoutButtonFontSize]];
    
}


#pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingCells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray*)[self.settingCells objectAtIndex:section]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseCellIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseCellIdentifier];
    }
    [cell.textLabel setText:[[self.settingCells objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case sectionFunction:{
            switch (indexPath.row) {
                case rowModifyPassword:
                    [self.delegate modifyPasswordCellDidSelected];
                    break;
                case rowPushNotification:
                    [self.delegate pushNotificationCellDidSelected];
                    break;
                case rowSystemMessage:
                    [self.delegate systemMessageCellDidSelected];
                    break;
                default:
                    break;
            }
        }
            break;
        case sectionEtc:{
            switch (indexPath.row) {
                case rowFeedback:
                    [self.delegate feedbackCellDidSelected];
                    break;
                case rowAboutUs:
                    [self.delegate aboutUsCellDidSelected];
                    break;
                case rowCheckUpdate:
                    [self.delegate checkUpdateCellDidSelected];
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
