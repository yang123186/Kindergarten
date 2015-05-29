//
//  NameListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "NameListController.h"
#import "General.h"


@interface NameListController ()

@end




@implementation NameListController

-(instancetype)init{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if(self=[super initWithCollectionViewLayout:flowLayout]){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
//    self addObserver:self forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>
    
    

}

-(void)requestStudentList{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
//    manager GET:STUDENTS_LIST_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }
}


@end
