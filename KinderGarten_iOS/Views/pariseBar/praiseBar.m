//
//  praiseBar.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "praiseBar.h"
#import "General.h"

static const CGFloat    praiseEdgeLength=15.0f;

@interface PraiseBar()

@property   (nonatomic,strong)  NSMutableArray  *praiseArray;
@property   (nonatomic,strong)  UIImageView     *praiseImage;
@property   (nonatomic,assign)  NSInteger       line;

@end

@implementation PraiseBar

-(instancetype)init{
    if(self=[super init]){
        self.praiseArray=[[NSMutableArray alloc]initWithCapacity:1];
        self.praiseImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about"]];
        self.praiseImage.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:self.praiseImage];
        [self.praiseImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.width.equalTo([NSNumber numberWithDouble:praiseEdgeLength]);
            make.height.equalTo([NSNumber numberWithDouble:praiseEdgeLength]);
        }];
    }
    return self;
}

-(instancetype)initWithSocialLikeModal:(SocialLikesContainer *)container{
    if(self=[self init]){
        [self setViewForSocialLikeModal:container];
    }
    return self;
}


-(void)setViewForSocialLikeModal:(SocialLikesContainer *)container{
    
    if(self.praiseArray.count>0){
        for(UIButton *button in self.praiseArray){
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                //remove all constrains.
            }];
        }
    }
    [self.praiseArray removeAllObjects];
    
    
    self.line=1;
    for(NSInteger itr=0;itr<container.aLikes.count;++itr){
        UIButton *praiseNameButton=[[UIButton alloc]init];
        praiseNameButton.tag=itr;
        [praiseNameButton setTitle:[container modalAtIndex:itr].name forState:UIControlStateNormal];
        praiseNameButton.translatesAutoresizingMaskIntoConstraints=NO;
        [praiseNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(praiseNameButton.mas_width);
            make.height.equalTo([NSNumber numberWithDouble:praiseEdgeLength]);
            if(itr==0){
                make.left.equalTo(self.praiseImage.mas_right);
            }
            else{
                UIButton *preButton=[self.praiseArray objectAtIndex:itr-1];
                
                if(preButton.mas_right<self.mas_right){
                    make.left.equalTo(preButton.mas_right);
                    make.top.equalTo(preButton.mas_top);
                }
                else{
                    self.line=self.line+1;
                    make.left.equalTo(self.praiseImage.mas_left);
                    make.top.equalTo(preButton.mas_bottom);
                }
                
            }
        }];
    }
    _height=self.line*praiseEdgeLength;
    
}




@end
