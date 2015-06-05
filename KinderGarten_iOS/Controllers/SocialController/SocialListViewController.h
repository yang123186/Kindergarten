//
//  SocialListViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/31/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SocialListController;
@interface SocialListViewController : NSObject<UITableViewDataSource,UITableViewDelegate>
@property   (nonatomic,strong)  UITableView *tableView;


-(instancetype)initWithRootController:(SocialListController*)controller;



@end
