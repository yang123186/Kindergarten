//
//  HonorListViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class HonorListViewController;
@protocol HonorListDelegate <NSObject>

-(void)honorListFromController:(HonorListViewController*)controller didSelectedItemAtIndex:(NSInteger)index;

@end

@class HonorListController;
@interface HonorListViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    HonorListController *controller;
@property   (nonatomic,weak)    UIView              *view;

@property   (nonatomic,strong)  UITableView         *tableView;
@property   (nonatomic,weak)    id<HonorListDelegate>   delegate;

-(instancetype)initWithRootController:(HonorListController*)controller;

@end
