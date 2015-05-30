//
//  SocialListController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialListController.h"
#import "General.h"
#import "SocialListModal.h"
#import "SocialListCell.h"


@interface SocialListController ()

@property   (nonatomic,strong)  SocialListContainer *modal;
@property   (nonatomic,strong)  NSMutableArray      *cellStorage;
@end

@implementation SocialListController

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewStylePlain]){
        self.modal=[[SocialListContainer alloc]init];
        self.cellStorage=[[NSMutableArray alloc]init];
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"modal" options:NSKeyValueObservingOptionNew context:nil];
    [self requestSocialDatas];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [self requestSocialDatas];
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"modal"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"modal"]){
        [self cellReload];
        [self.tableView reloadData];
    }
    else{
        DLog(@"SocialListController : observe a unknow keypath : %@",keyPath);
    }
}

-(void)cellReload{
    [self.cellStorage removeAllObjects];
    for (NSInteger itr=0; itr<self.modal.aSocials.count; ++itr) {
        SocialListModal *modal=[self.modal socialListModalAtIndex:itr];
        SocialListCell *cell=[[SocialListCell alloc]init];
        [cell setViewForModal:modal];
//        [cell.contentView setNeedsLayout];
//        [cell.contentView layoutIfNeeded];
//        [cell setNeedsUpdateConstraints];
//        [cell updateConstraintsIfNeeded];
        [self.cellStorage addObject:cell];
    }
}

-(void)requestSocialDatas{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager GET:@"http://1.r7test.sinaapp.com/SocialList.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        DLog(@"%@",responseObject);
        self.modal=[self.modal initWithSocialsArray:[responseObject objectForKey:@"socials"]];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%li",(long)operation.response.statusCode);
        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    }];
}


-(void)publishNewMoment{
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellStorage.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SocialListCell *cell=[self.cellStorage objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SocialListCell *cell=[self.cellStorage objectAtIndex:indexPath.row];
//    [cell.contentView layoutIfNeeded];
//    [cell layoutIfNeeded];

    return  cell.height;
}

@end
