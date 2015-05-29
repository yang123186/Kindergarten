//
//  HonorListController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HonorListViewController.h"
#import "PersonalFlowerModal.h"
#import "NavigationTopButton.h"
#import "HonorCollectionViewController.h"


static NSString *observeTodayContainerKey=@"todayContainer";
static NSString *observeWeekContainerKey=@"weekContainer";
static NSString *observeMonthContainerKey=@"monthContainer";
static const    CGFloat     sendFlowerButtonHeight=40.0f;



@interface HonorListController : UIViewController<NavigationTopButtonDelegate,HonorCollectionDelegate>

@property   (nonatomic,strong)  PersonalFlowerContainer *todayContainer;
@property   (nonatomic,strong)  PersonalFlowerContainer *weekContainer;
@property   (nonatomic,strong)  PersonalFlowerContainer *monthContainer;


@property   (nonatomic,strong)  HonorListViewController *viewController;
@property   (nonatomic,strong)  HonorCollectionViewController   *weekCollectionViewController;
@property   (nonatomic,strong)  HonorCollectionViewController   *monthCollectionVierController;

@property   (nonatomic,strong)  NavigationTopButton *topButton;
@property   (nonatomic,strong)  UIButton            *sendFlowerButton;


-(instancetype)init;

-(void)requestTodayHonorList;
-(void)requestThisWeekHonorList;
-(void)requestThisMonthHonorList;

@end
