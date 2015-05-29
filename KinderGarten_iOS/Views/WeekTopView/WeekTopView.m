//
//  WeekTopView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "WeekTopView.h"
#import "General.h"


static const CGFloat    dayOfAweek=5;
static const CGFloat    dayButtonEdgeLength=30.0f;
static const CGFloat    dayButtonPaddingVertical=10.0f;
static CGFloat  buttonPaddingHorizontal;

@interface WeekTopView ()
@property   (nonatomic,strong)  NSMutableArray *weekButtonArray;
@property   (nonatomic,strong)  NSArray         *weekTitlCn;
@property   (nonatomic,weak)    UIButton        *selectedButton;

@end

@implementation WeekTopView

-(instancetype)init{
    if(self=[super init]){
        buttonPaddingHorizontal=([Screen width]-dayOfAweek*dayButtonEdgeLength)/(dayOfAweek+1);
        self.weekButtonArray=[[NSMutableArray alloc]initWithCapacity:dayOfAweek];
        self.weekTitlCn=[[NSArray alloc]initWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"日", nil];
        [self createView];
    }
    return self;
}

-(instancetype)initWithDefaultDay:(NSInteger)day{
    if(self=[self init]){
        [self selectDay:day];
    }
    return self;
}

-(void)createView{
    UIView *preView;
    for(NSInteger itr=0;itr<dayOfAweek;++itr){
        UIButton *dayButton=[[UIButton alloc]init];
        [dayButton addTarget:self action:@selector(weekButtonDidSelected:) forControlEvents:UIControlEventTouchUpInside];
        [dayButton setTitle:[self.weekTitlCn objectAtIndex:itr] forState:UIControlStateNormal];
        [dayButton setTag:itr+1];
        [dayButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [dayButton setBackgroundColor:PINK_COLOR];
        [dayButton setCircleRadius:dayButtonEdgeLength/2];
        dayButton.translatesAutoresizingMaskIntoConstraints=NO;
        [self.weekButtonArray addObject:dayButton];
        [self addSubview:dayButton];
        [dayButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(dayButtonPaddingVertical);
            make.height.equalTo([NSNumber numberWithDouble:dayButtonEdgeLength]);
            make.width.equalTo([NSNumber numberWithDouble:dayButtonEdgeLength]);
            if(!preView){
                make.left.equalTo(self.mas_left).with.offset(buttonPaddingHorizontal);
            }
            else{
                make.left.equalTo(preView.mas_right).with.offset(buttonPaddingHorizontal);
            }
        }];
        preView=dayButton;
    }
}


-(void)selectDay:(NSInteger)day{
    if(self.selectedButton){
        [self.selectedButton setBackgroundColor:PINK_COLOR];
    }
    self.selectedButton=[self.weekButtonArray objectAtIndex:day-1];
    [self.selectedButton setBackgroundColor:PINK_LIGHT_COLOR];
}

-(void)weekButtonDidSelected:(UIButton*)sender{
    if([self.delegate respondsToSelector:@selector(dayButtonDidSelectedAtDay:)]){
        [self.delegate dayButtonDidSelectedAtDay:sender.tag];
        [self selectDay:sender.tag];
    }
}


+(CGFloat)height{
    return 2*dayButtonPaddingVertical+dayButtonEdgeLength;
}

@end
