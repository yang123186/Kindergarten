//
//  HonorListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "HonorListController.h"
#import "General.h"
#import "PersonFlowerController.h"

static const    NSUInteger  titleNumber=3;

static NSString *sendFlowerButtonTitle=@"立即送红花";

@interface HonorListController()
@property   (nonatomic,strong)  NSArray             *topButtonTitles;

@end

@implementation HonorListController


-(instancetype)init{
    if(self=[super init]){
        self.todayContainer=[[PersonalFlowerContainer alloc]init];
        self.weekContainer=[[PersonalFlowerContainer alloc]init];
        self.monthContainer=[[PersonalFlowerContainer alloc]init];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self createButtons];
    
    self.viewController=[[HonorListViewController alloc]initWithRootController:self];
//    self.viewController.delegate=self;
    self.weekCollectionViewController=[[HonorCollectionViewController alloc]initWithRootController:self container:self.weekContainer observeKey:observeWeekContainerKey];
    self.weekCollectionViewController.delegate=self;
    self.monthCollectionVierController=[[HonorCollectionViewController alloc]initWithRootController:self container:self.monthContainer observeKey:observeMonthContainerKey];
    self.monthCollectionVierController.delegate=self;
    
    [self addObserver:self.viewController forKeyPath:observeTodayContainerKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self.weekCollectionViewController forKeyPath:observeWeekContainerKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self.monthCollectionVierController forKeyPath:observeMonthContainerKey options:NSKeyValueObservingOptionNew context:nil];
    
    
    [self requestTodayHonorList];
    [self requestThisWeekHonorList];
    [self requestThisMonthHonorList];
    [self buttonTouchedAtIndex:0];
    
}

-(void)dealloc{
    [self removeObserver:self.viewController forKeyPath:observeTodayContainerKey];
    [self removeObserver:self.weekCollectionViewController forKeyPath:observeWeekContainerKey];
    [self removeObserver:self.monthCollectionVierController forKeyPath:observeMonthContainerKey];
}

-(void)createButtons{
    self.topButtonTitles=[NSArray arrayWithObjects:@"今天",@"本周",@"本月" ,nil];
    self.topButton=[[NavigationTopButton alloc]initWithButtonNumber:titleNumber];
    self.topButton.delegate=self;
    [self.topButton setTitlesWithArray:self.topButtonTitles];
    [self.view addSubview:self.topButton];
    self.topButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:[NavigationTopButton height]]);
    }];

    self.sendFlowerButton=[[UIButton alloc]init];
    [self.sendFlowerButton setTitle:sendFlowerButtonTitle forState:UIControlStateNormal];
    [self.sendFlowerButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self.sendFlowerButton setBackgroundColor:PINK_COLOR];
    self.sendFlowerButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:self.sendFlowerButton];
    [self.sendFlowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:sendFlowerButtonHeight]);
    }];
}

-(void)buttonTouchedAtIndex:(NSUInteger)index{
    if(index==0){
        self.viewController.tableView.hidden=NO;
        self.weekCollectionViewController.collectionView.hidden=YES;
        self.monthCollectionVierController.collectionView.hidden=YES;
    }
    else if (index==1){
        self.viewController.tableView.hidden=YES;
        self.weekCollectionViewController.collectionView.hidden=NO;
        self.monthCollectionVierController.collectionView.hidden=YES;
    }
    else{
        self.viewController.tableView.hidden=YES;
        self.weekCollectionViewController.collectionView.hidden=YES;
        self.monthCollectionVierController.collectionView.hidden=NO;
    }
}


-(void)requestTodayHonorList{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSInteger interval=[[NSDate date]timeIntervalSince1970];
    NSNumber *timeInterval=[NSNumber numberWithInteger:interval];
    DLog(@"%@",timeInterval.stringValue);
    [manager GET:TODAY_HONOR_LIST_PATH(timeInterval.stringValue) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.todayContainer=[self.todayContainer initWithArray:[responseObject objectForKey:@"flowers"]];
//        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding] );
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)requestThisWeekHonorList{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSInteger interval=[[NSDate date]timeIntervalSince1970];
    NSNumber *timeInterval=[NSNumber numberWithInteger:interval];
    DLog(@"%@",timeInterval.stringValue);
    [manager GET:TODAY_HONOR_LIST_PATH(timeInterval.stringValue) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.weekContainer=[self.todayContainer initWithArray:[responseObject objectForKey:@"flowers"]];
//        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding] );
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


-(void)requestThisMonthHonorList{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSInteger interval=[[NSDate date]timeIntervalSince1970];
    NSNumber *timeInterval=[NSNumber numberWithInteger:interval];
    DLog(@"%@",timeInterval.stringValue);
    [manager GET:TODAY_HONOR_LIST_PATH(timeInterval.stringValue) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.monthContainer=[self.todayContainer initWithArray:[responseObject objectForKey:@"flowers"]];
//        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding] );
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


-(void)honorCollectionFromController:(HonorCollectionViewController*)controller didSelectItemAtIndex:(NSInteger)index{
    if(controller==self.weekCollectionViewController){
        PersonFlowerController *flowerCtrl=[[PersonFlowerController alloc]initWithStudentId:[self.weekContainer modalAtIndex:index].studentId];
        [self.navigationController pushViewController:flowerCtrl animated:YES];
    }
    else{
        PersonFlowerController *flowerCtrl=[[PersonFlowerController alloc]initWithStudentId:[self.monthContainer modalAtIndex:index].studentId];
        [self.navigationController pushViewController:flowerCtrl animated:YES];
    }
}




@end
