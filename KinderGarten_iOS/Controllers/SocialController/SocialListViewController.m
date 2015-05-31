//
//  SocialListViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/31/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialListViewController.h"
#import "SocialListController.h"
#import "General.h"

@interface SocialListViewController()

@property   (nonatomic,weak)    SocialListController *controller;
@property   (nonatomic,weak)    UIView               *view;

@end

@implementation SocialListViewController


-(instancetype)initWithRootController:(SocialListController *)controller{
    if(self=[super init]){
        self.controller=controller;
        self.view=controller.view;
        [self createView];
    }
    return self;
}

-(void)createView{
    self.tableView=[[UITableView alloc]init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    
}




#pragma mark - Table view data source

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    if (!self.controller.isLoading) {
        CGFloat height = scrollView.contentSize.height > self.tableView.frame.size.height ?self.tableView.frame.size.height : scrollView.contentSize.height;
        if ((height - scrollView.contentSize.height + scrollView.contentOffset.y) / height > 0.2) {
            self.controller.isLoading=YES;
            [self.controller requestSocialDatasWithTimeStamp:1];
        }
        
        
        
        if (- scrollView.contentOffset.y / self.tableView.frame.size.height > 0.2) {
            self.controller.isLoading=YES;
            [self.controller requestSocialDatasWithTimeStamp:HEAD_DATA_TYPE];
            
        }
        
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.cellStorage.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SocialListCell *cell=[self.controller.cellStorage objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SocialListCell *cell=[self.controller.cellStorage objectAtIndex:indexPath.row];
    //    [cell.contentView layoutIfNeeded];
    //    [cell layoutIfNeeded];
    
    return  cell.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
