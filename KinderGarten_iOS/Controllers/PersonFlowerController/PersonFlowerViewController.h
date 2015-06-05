//
//  PersonFlowerViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonFlowerTopView.h"

@class PersonFlowerController;
@interface PersonFlowerViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,weak)    PersonFlowerController  *controller;
@property   (nonatomic,weak)    UIView                  *view;
@property   (nonatomic,strong)  PersonFlowerTopView     *topView;


@property   (nonatomic,strong)  UITableView             *tableView;


-(instancetype)initWithRootController:(PersonFlowerController*)controller;

@end
