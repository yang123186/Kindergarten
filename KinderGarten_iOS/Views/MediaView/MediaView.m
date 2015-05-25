//
//  MediaView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MediaView.h"
#import "General.h"
#import "UIImageView+AFNetworking.h"

static CGFloat  mediaEdgeLength;
static const    NSInteger mediaNum=3;
static const    CGFloat marginHorizontal=15.0f;
static const    CGFloat marginVertical=15.0f;


@interface MediaView()

@property   (nonatomic,strong)  NSMutableArray  *mediaArray;

@end




@implementation MediaView

-(instancetype)init{
    if(self=[super init]){
        mediaEdgeLength=([Screen width]-(mediaNum+1)*marginHorizontal)/3;
        self.mediaArray=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

-(void)setViewForArray:(NSArray *)array{
    if(self.mediaArray.count>0){
        for(UIImageView *media in self.mediaArray){
            if(media.superview){
                [media removeFromSuperview];
                [media mas_remakeConstraints:^(MASConstraintMaker *make) {}];
            }
        }
        [self.mediaArray removeAllObjects];
    }
    NSInteger rowNumer=array.count/mediaNum;
    NSInteger restMedia=array.count%mediaNum;
    if(restMedia>0){
        rowNumer++;
    }
    _height=mediaEdgeLength*rowNumer+(rowNumer-1)*marginVertical;
        
    for(NSInteger itr=0;itr<array.count;++itr){
        NSString *url=[array objectAtIndex:itr];
        UIImageView *mediaView=[[UIImageView alloc]init];
        [mediaView setImageWithURL:[NSURL URLWithString:url]];
        [self.mediaArray addObject:mediaView];
        mediaView.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:mediaView];
        [mediaView mas_makeConstraints:^(MASConstraintMaker *make) {
            if((itr/mediaNum)==0){
                make.top.equalTo(self.mas_top);
            }
            else{
                UIImageView *preImageV=[self.mediaArray objectAtIndex:itr-mediaNum];
                make.top.equalTo(preImageV.mas_bottom).with.offset(marginVertical);
            }
            
            if((itr%mediaNum)==0){
                make.left.equalTo(self.mas_left);
            }
            else{
                UIImageView *preImageV=[self.mediaArray objectAtIndex:itr-1];
                make.left.equalTo(preImageV.mas_right).with.offset(marginHorizontal);
            }
            make.width.equalTo([NSNumber numberWithDouble:mediaEdgeLength]);
            make.height.equalTo([NSNumber numberWithDouble:mediaEdgeLength]);
            
        }];
    }

}

-(instancetype)initWithMediaArray:(NSArray *)array{
    if(self=[self init]){
        [self setViewForArray:array];
    }
    return self;
}






@end
