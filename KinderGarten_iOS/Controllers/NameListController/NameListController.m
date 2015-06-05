//
//  NameListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "NameListController.h"
#import "General.h"
#import "CommonCollectionCell.h"
#import "FlowerListController.h"

static NSString* const  studentContainerKey=@"container";
static NSString* const  studentCollectionCellIdentifier=@"StudentCollectionCell";


@interface NameListController ()

@end




@implementation NameListController

-(instancetype)init{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if(self=[super initWithCollectionViewLayout:flowLayout]){
        self.container=[[FlowerStudentsContainer alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[CommonCollectionCell class] forCellWithReuseIdentifier:studentCollectionCellIdentifier];
    [self.collectionView setBackgroundColor:GRAY_BACKGROUND];
    [self addObserver:self forKeyPath:studentContainerKey options:NSKeyValueObservingOptionNew context:nil];
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self requestStudentList];
    
    UIBarButtonItem *cancelButton=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissMe)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];

}

-(void)dealloc{
    [self removeObserver:self forKeyPath:studentContainerKey];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:studentContainerKey]) {
        [self.collectionView reloadData];
    }
}

-(void)dismissMe{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)requestStudentList{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    [manager GET:STUDENTS_LIST_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.container=[self.container initWithArray:[responseObject objectForKey:@"students"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@",error);
        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    }];
}



#pragma mark CollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.container.students.count;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CommonCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:studentCollectionCellIdentifier forIndexPath:indexPath];
    if(!cell){
        DLog(@"cell is nil");
    }
    StudentNameListMOdal *modal=[self.container modalAtIndex:indexPath.row];
    [cell setViewImageWithURL:modal.avatar text:modal.name];
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([CommonCollectionCell width], [CommonCollectionCell height]);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FlowerListController *flowerListCtrl=[[FlowerListController alloc]initWithStudentId:[self.container modalAtIndex:indexPath.row]._id];
    [self.navigationController pushViewController:flowerListCtrl animated:YES];
}



@end
