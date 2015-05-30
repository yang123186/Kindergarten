//
//  ScheduleController.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "ScheduleController.h"
#import "General.h"

static NSString* const observeModalKey=@"modal";
static NSString* const observeOffsetKey=@"selectedOffset";
static NSString* const recipeKey=@"receipe";

@interface ScheduleController ()
@property   (nonatomic,assign) NSInteger selectIndex;
@property   (nonatomic,assign)  NSInteger   selectedOffset;

@end

@implementation ScheduleController

-(instancetype)init{
    if (self=[super init]) {
        _defaultDate=[NSDate date];
        self.selectedOffset=0;
        self.selectIndex=self.defaultDate.dayInWeek;
        self.modal=[[ScheduleModal alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:observeModalKey options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:observeOffsetKey options:NSKeyValueObservingOptionNew context:nil];
    
    self.viewController=[[ScheduleViewController alloc]initWithRootController:self];
    [self requsetRecipeWithOffset:self.selectedOffset];
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:observeModalKey];
    [self removeObserver:self forKeyPath:observeOffsetKey];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:observeModalKey]){
        [self.viewController.tableView reloadData];
    }
    else if([keyPath isEqualToString:observeOffsetKey]){
        DLog(@"offset %li",(long)self.selectedOffset);
        [self requsetRecipeWithOffset:self.selectedOffset];
    }
}

-(void)requsetRecipeWithOffset:(NSInteger)offset{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager beJsonManager];
    [manager setCommonlyUsedRequsetHeaderFiled];
#warning The url actually is not defined!!
    [manager GET:SCHEDULE_PATH([NSNumber numberWithInteger:offset].stringValue) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *recipeDic=[responseObject objectForKey:recipeKey];
        if(recipeDic){
            DLog(@"recipe is null");
        }
        else{
            self.modal=[self.modal initWithDictionary:[responseObject objectForKey:recipeKey]];
        }
        DLog(@"\n\n%@\n\n",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
}


-(void)dayButtonDidSelectedAtIndex:(NSInteger)index{
    self.selectedOffset=self.selectedOffset+index-self.selectIndex;
    self.selectIndex=index;
}


-(void)lastWeekButtonTouched{
    self.selectedOffset=self.selectedOffset-7;
}

-(void)nextWeekButtonTouched{
    self.selectedOffset=self.selectedOffset+7;
}

-(void)selectedDate:(NSDate *)date{
    self.selectedOffset=[date dayNumberFromNow];
    self.selectIndex=[date dayInWeek];
    [self.viewController.topView selectDay:self.selectIndex];
}

-(void)calendarButtonTouched{
    [self.viewController calendarShoulShow];
}



@end
