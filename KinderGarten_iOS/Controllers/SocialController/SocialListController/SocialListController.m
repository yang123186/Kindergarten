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
@property   (nonatomic,assign)  DataType            dateType;
@property   (nonatomic,assign)  BOOL                isLoading;
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
    [self requestSocialDatasWithTimeStamp:HEAD_DATA_TYPE];
    self.isLoading=YES;
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
    NSInteger itr;
    if(self.dateType==HeadData){
        [self.cellStorage removeAllObjects];
        itr=0;
    }
    else if(self.dateType==AppendData){
        itr=self.cellStorage.count;
    }
    
    for (; itr<self.modal.aSocials.count; ++itr) {
        SocialListModal *modal=[self.modal socialListModalAtIndex:itr];
        SocialListCell *cell=[[SocialListCell alloc]init];
        cell.delegate=self;
        [cell setViewForModal:modal];
        [self.cellStorage addObject:cell];
    }
}

-(void)requestSocialDatasWithTimeStamp:(NSInteger)timeStampInt{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    
    NSNumber *timeStamp;
    
    if(timeStampInt<0){
        NSInteger nowInterval=[[NSDate date]timeIntervalSince1970];
        timeStamp= [NSNumber numberWithInteger:nowInterval];
    }
    else{
        timeStamp=[NSNumber numberWithInteger:timeStampInt];
    }
    
    [manager GET:@"http://1.r7test.sinaapp.com/SocialList_lite.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(timeStampInt<0){
            self.dateType=HeadData;
            self.modal=[self.modal initWithSocialsArray:[responseObject objectForKey:@"socials"]];
        }
        else{
            self.dateType=AppendData;
            self.modal=[self.modal initWithAppendArray:[responseObject objectForKey:@"socials"]];
        }
        self.isLoading=NO;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%li",(long)operation.response.statusCode);
        DLog(@"%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        self.isLoading=NO;
    }];
}


-(void)publishNewMoment{
    
}

#pragma mark - Table view data source

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    if (!self.isLoading) {
        CGFloat height = scrollView.contentSize.height > self.tableView.frame.size.height ?self.tableView.frame.size.height : scrollView.contentSize.height;
        if ((height - scrollView.contentSize.height + scrollView.contentOffset.y) / height > 0.2) {
            self.isLoading=YES;
            [self requestSocialDatasWithTimeStamp:1];
        }
        
        
        
        if (- scrollView.contentOffset.y / self.tableView.frame.size.height > 0.2) {
            self.isLoading=YES;
            [self requestSocialDatasWithTimeStamp:HEAD_DATA_TYPE];
            
        }
        
    }
    
}


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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)praiseButtonDidTouchedInCell:(SocialListCell *)cell{
    NSInteger index=[self.tableView indexPathForCell:cell].row;
    NSString *socialId=[self.modal socialListModalAtIndex:index]._id;
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager PUT:SOCIAL_PRAISE_PATH(socialId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)commentButtonDidTouchedInCell:(SocialListCell *)cell{
    
}

@end
