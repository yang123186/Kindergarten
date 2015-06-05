//
//  HonorCollectionViewController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "HonorCollectionViewController.h"
#import "HonorListController.h"
#import "General.h"
#import "NavigationTopButton.h"
#import "FlowerCollectionCell.h"

@implementation HonorCollectionViewController

-(instancetype)initWithRootController:(HonorListController *)controller container:(PersonalFlowerContainer *)container observeKey:(NSString *)observeKey{
    if(self=[super init]){
        self.observeKey=observeKey;
        self.container=container;
        self.controller=controller;
        self.view=controller.view;
        [self createView];
//        [self.controller addObserver:self forKeyPath:observeKey options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)createView{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, [Screen topBarHeight]+[NavigationTopButton height], [Screen width], [Screen height]-[Screen topBarHeight]-sendFlowerButtonHeight) collectionViewLayout:flowLayout];
    self.collectionView.hidden=YES;
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.controller.topButton.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-sendFlowerButtonHeight);
    }];
    [self.collectionView registerClass:[FlowerCollectionCell class] forCellWithReuseIdentifier:FlowerCollectionCellIdentifier];
    [self.collectionView setBackgroundColor:GRAY_BACKGROUND];

}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.container.container.count;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FlowerCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:FlowerCollectionCellIdentifier forIndexPath:indexPath];
    if(!cell){
        DLog(@"cell is nil");
    }
    [cell setViewForModal:[self.container modalAtIndex:indexPath.row]];
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(flowerCollectionCellWidth, flowerCollectionCellHeight);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if([self.delegate respondsToSelector:@selector(honorCollectionFromController:didSelectItemAtIndex:)]){
        [self.delegate honorCollectionFromController:self didSelectItemAtIndex:indexPath.row];
    }
}

#pragma mark KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:self.observeKey]){
        self.container=[self.controller valueForKey:self.observeKey];
        [self.collectionView reloadData];
    }
}

@end
