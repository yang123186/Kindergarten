//
//  RecipeCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RecipeCell.h"
#import "General.h"

static const CGFloat    contentViewPadding=10.0f;

static const CGFloat    paddingVertical=10.0f;
static const NSInteger  picNumberEachRow=3;
static const CGFloat    titleLabelHeight=30.0f;
static const CGFloat    paddingHorizontal=10.0f;
static CGFloat    pictureEdgeHeight=-1;

static NSArray *mealTitles;

@interface RecipeCell ()
@property   (nonatomic,strong)  NSMutableArray *pictureArray;
@end


@implementation RecipeCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RecipeCellIdentifier]){
        [self initMealTitles];
        pictureEdgeHeight=([Screen width]-paddingHorizontal*(picNumberEachRow+3))/picNumberEachRow;
        self.pictureArray=[[NSMutableArray alloc]initWithCapacity:0];
        [self createView];
    }
    return self;
}

-(void)initMealTitles{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mealTitles=@[@"早餐",@"上午加餐",@"午餐",@"下午加餐",@"晚餐"];
    });
}

-(void)createView{
    UIView *contentView=self.contentView;
    [contentView setBackgroundColor:PINK_COLOR];
    contentView.translatesAutoresizingMaskIntoConstraints=NO;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(contentViewPadding/2, contentViewPadding, contentViewPadding/2, contentViewPadding));
    }];
    
    self.titleLabel=[[UILabel alloc]init];
    [self.titleLabel setTextColor:WHITE_COLOR];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top);
        make.left.equalTo(contentView.mas_left);
        make.right.equalTo(contentView.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:titleLabelHeight]);
    }];
}

-(void)setViewWithArray:(NSArray*)array{
    for (UIImageView *picutre in self.pictureArray) {
        if(picutre.superview){
            [picutre mas_remakeConstraints:^(MASConstraintMaker *make) {}];
            [picutre removeFromSuperview];
        }
    }
    [self.pictureArray removeAllObjects];
    
    for(NSInteger itr=0;itr<array.count;++itr){
        UIImageView *picture=[[UIImageView alloc]init];
        [picture setImageWithURL:[array objectAtIndex:itr]];
        picture.translatesAutoresizingMaskIntoConstraints=NO;
        [self.contentView addSubview:picture];
        [picture mas_makeConstraints:^(MASConstraintMaker *make) {
            if(itr%picNumberEachRow==0){
                make.left.equalTo(self.contentView.mas_left).with.offset(paddingHorizontal);
            }
            else{
                UIImageView *preView=[self.pictureArray objectAtIndex:itr-1];
                make.left.equalTo(preView.mas_right).with.offset(paddingHorizontal);
            }
            if(itr/picNumberEachRow==0){
                make.top.equalTo(self.contentView.mas_top).with.offset(paddingVertical);
            }
            else{
                UIImageView *preView=[self.pictureArray objectAtIndex:itr-picNumberEachRow];
                make.top.equalTo(preView.mas_bottom).with.offset(paddingVertical);
            }
            make.height.equalTo([NSNumber numberWithDouble:pictureEdgeHeight]);
            make.width.equalTo(picture.mas_height);
        }];
    }
    
}

-(void)setViewForModal:(MealModal *)modal{
    [self.titleLabel setText:[mealTitles objectAtIndex:modal.type.integerValue]];
}


+(CGFloat)heightWithPicNumber:(NSInteger)numeber{
    if(pictureEdgeHeight<0){
        pictureEdgeHeight=([Screen width]-paddingHorizontal*(picNumberEachRow+3))/picNumberEachRow;
    }
    NSInteger col=numeber/picNumberEachRow;
    NSInteger row=numeber%picNumberEachRow;
    if(row>0){
        ++col;
    }
    return titleLabelHeight+pictureEdgeHeight*col;
}

@end
