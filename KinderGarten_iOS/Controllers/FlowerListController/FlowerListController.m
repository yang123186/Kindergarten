//
//  FlowerListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "FlowerListController.h"
#import "CommonCollectionCell.h"
#import "General.h"


@interface FlowerListController ()
@property   (nonatomic,copy) NSString   *studentId;
@end

@implementation FlowerListController

static NSString* const  flowerCollectionCellIdentifier=@"FlowerCollectionCell";
static NSString* const  observeContainerKey=@"container";


-(instancetype)initWithStudentId:(NSString *)studentId{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if(self=[super initWithCollectionViewLayout:flowLayout]){
        self.studentId=studentId;
        self.container=[[FlowerContainer alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView setBackgroundColor:GRAY_BACKGROUND];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[CommonCollectionCell class] forCellWithReuseIdentifier:flowerCollectionCellIdentifier];
    [self addObserver:self forKeyPath:observeContainerKey options:NSKeyValueObservingOptionNew context:nil];
    [self requestForAvailableFlowers];
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:observeContainerKey];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:observeContainerKey]) {
        [self.collectionView reloadData];
    }
}



-(void)requestForAvailableFlowers{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager GET:FLOWER_LIST_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.container=[self.container initWithArray:[responseObject objectForKey:@"flower"] ];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)sendFlowers:(NSString*)flowerId toStudent:(NSString*)studentId{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    [manager PUT:ASSIGN_FLOWER_PATH(flowerId, studentId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.container.container.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CommonCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:flowerCollectionCellIdentifier forIndexPath:indexPath];
    if(!cell){
        cell=[[CommonCollectionCell alloc]init];
    }
    FlowerModal *modal=[self.container modalAtIndex:indexPath.row];
    [cell setViewImageWithURL:modal.icon text:modal.name];
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([CommonCollectionCell width], [CommonCollectionCell height]);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self sendFlowers:[self.container modalAtIndex:indexPath.row]._id toStudent:self.studentId];
}

@end
