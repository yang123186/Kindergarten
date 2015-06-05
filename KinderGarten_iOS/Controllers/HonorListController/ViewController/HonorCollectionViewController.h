//
//  HonorCollectionViewController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HonorCollectionViewController;
@protocol HonorCollectionDelegate <NSObject>

-(void)honorCollectionFromController:(HonorCollectionViewController*)controller didSelectItemAtIndex:(NSInteger)index;

@end

@class HonorListController,PersonalFlowerContainer;
@interface HonorCollectionViewController : NSObject<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property   (nonatomic,weak)    HonorListController *controller;
@property   (nonatomic,weak)    UIView              *view;
@property   (nonatomic,weak)    PersonalFlowerContainer *container;
@property   (nonatomic,copy)    NSString            *observeKey;

@property   (nonatomic,strong)  UICollectionView    *collectionView;
@property   (nonatomic,weak)    id<HonorCollectionDelegate> delegate;


-(instancetype)initWithRootController:(HonorListController*)controller container:(PersonalFlowerContainer*)container observeKey:(NSString*)observeKey;

@end
