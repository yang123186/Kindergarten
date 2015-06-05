//
//  SettingViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SettingListDelegate <NSObject>

-(void)modifyPasswordCellDidSelected;
-(void)pushNotificationCellDidSelected;
-(void)systemMessageCellDidSelected;

-(void)feedbackCellDidSelected;
-(void)aboutUsCellDidSelected;
-(void)checkUpdateCellDidSelected;

@end




@class SettingController;
@interface SettingViewController : NSObject<UITableViewDataSource,UITableViewDelegate>

@property   (nonatomic,strong)  UITableView *tableView;
@property   (nonatomic,strong)  UIButton    *logoutButton;

@property   (nonatomic,weak)    SettingController   *superController;
@property   (nonatomic,weak)    id<SettingListDelegate> delegate;


/**
 *  the object is control setting controller's view
 *
 *  @param superController the root controller
 *
 *  @return A SettingViewController instance.
 */
-(instancetype)initWithSuperController:(SettingController*)superController;


/**
 *  Layout and create rootView's subview.
 */
-(void)createViews;

@end
