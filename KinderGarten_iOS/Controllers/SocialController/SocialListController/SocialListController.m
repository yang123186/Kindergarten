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
#import "PublishCommentView.h"

static const CGFloat    commentViewHeight=50.0f;

@interface SocialListController ()

@property   (nonatomic,strong)  PublishCommentView  *commentView;

@property   (nonatomic,strong)  SocialListContainer *modal;
@property   (nonatomic,assign)  DataType            dateType;
@end

@implementation SocialListController

-(instancetype)init{
    if(self=[super init]){
        self.modal=[[SocialListContainer alloc]init];
        self.cellStorage=[[NSMutableArray alloc]init];
        self.commentView=[[PublishCommentView alloc]initWithFrame:CGRectMake(0.0f, [Screen height]-commentViewHeight-[Screen topBarHeight], [Screen width], commentViewHeight) onView:self.view];
        DLog(@"commentView frame :%@",NSStringFromCGRect(self.commentView.frame));
        DLog(@"screen bounds:%@",NSStringFromCGRect([Screen bounds]));
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:WHITE_COLOR];
    [self addObserver:self forKeyPath:@"modal" options:NSKeyValueObservingOptionNew context:nil];
    self.viewController=[[SocialListViewController alloc]initWithRootController:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];


//    [self.view addSubview:self.commentView];
    [self requestSocialDatasWithTimeStamp:HEAD_DATA_TYPE];
    self.isLoading=YES;
}


- (void)keyboardWasShown:(NSNotification*)aNotification{
    
    NSDictionary *userInfo = [aNotification userInfo];
    CGRect keyBoardRect= [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    keyBoardRect = [self.view convertRect:keyBoardRect fromView:nil];
    
    CGRect newTextViewFrame = self.commentView.frame;
    newTextViewFrame.origin.y = keyBoardRect.origin.y - self.commentView.frame.size.height;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    self.commentView.frame = newTextViewFrame;
    [UIView commitAnimations];
    self.commentView.preHeight=self.commentView.textView.contentSize.height;
}


- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.3f animations:^{
        self.commentView.frame=CGRectMake(0.0f, [Screen height]- [Screen topBarHeight]-self.commentView.frame.size.height, [Screen width], self.commentView.frame.size.height);
    }];
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:@"modal"];
    [[NSNotificationCenter defaultCenter] removeObserver:self.commentView];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"modal"]){
        [self cellReload];
        [self.viewController.tableView reloadData];
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
//    @"http://1.r7test.sinaapp.com/SocialList_lite.json"
    [manager GET:SOCIAL_LIST_PATH parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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


-(void)praiseButtonDidTouchedInCell:(SocialListCell *)cell{
    NSInteger index=[self.viewController.tableView indexPathForCell:cell].row;
    NSString *socialId=[self.modal socialListModalAtIndex:index]._id;
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
    [manager PUT:SOCIAL_PRAISE_PATH(socialId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)commentButtonDidTouchedInCell:(SocialListCell *)cell{
    NSString *theId=[self.modal socialListModalAtIndex:[self.viewController.tableView indexPathForCell:cell].row]._id;
    PublishCommentView *commentView=self.commentView;
    self.commentView.block=^(NSString* content) {
        AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
        [manager beJsonManager];
        [manager setCommonlyUsedRequsetHeaderFiled];
        
        NSDictionary *postInfo=@{@"content":content};
        
        [manager PUT:COMMIT_COMMENT_PATH(theId) parameters:postInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if(operation.response.statusCode==REQUEST_SUCCESS){
                DLog(@"comment Success:201");
                [commentView removeFromSuperview];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"comment fail:%@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
        }];
    };
    [self.view addSubview:self.commentView];
    [self.commentView.textView becomeFirstResponder];
}

@end
