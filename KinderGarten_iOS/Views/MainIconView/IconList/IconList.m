//
//  IconList.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "IconList.h"
#import "MainIconView.h"
#import "General.h"


static  const   NSTimeInterval  animateDuration=0.3f;
static  const   CGFloat         leftPadding=17.0f;
static  const   CGFloat         verticalMargin=5.0f;

@interface IconList()

@property   (nonatomic,assign)  NSUInteger  showingIconIndex;
@property   (nonatomic,assign)  BOOL        isShowing;
@property   (nonatomic,strong)  NSMutableArray  *buttons;

@end

@implementation IconList

-(instancetype)initWithSuperView:(MainIconView*)superView Icons:(NSArray*)icons{
    if(self=[super init]){
        self.isShowing=NO;
        self.parentView=superView;
        self.icons=[[NSMutableArray alloc]init];
        self.buttons=[[NSMutableArray alloc]init];
        [self setIcons:icons withShowingIndex:1];
    }
    return self;
}

-(void)setIcons:(NSArray *)icons withShowingIndex:(NSUInteger)index{
    [self.icons removeAllObjects];
    [self.buttons removeAllObjects];
    [self.icons addObjectsFromArray:icons];
    for(NSUInteger itr=0;itr<self.icons.count;++itr){
        UIButton *iconButton=[[UIButton alloc]init];
        iconButton.tag=itr;
        [iconButton setFrame:CGRectMake(0.0f, -edgeLength, edgeLength, edgeLength)];
        [iconButton addTarget:self action:@selector(iconDidTouchedAtIndex:) forControlEvents:UIControlEventTouchUpInside];
        [iconButton setImage:[self.icons objectAtIndex:itr] forState:UIControlStateNormal];
        iconButton.layer.cornerRadius=edgeLength/2;
        [iconButton.layer setMasksToBounds:YES];
        [self.buttons addObject:iconButton];
    }
    self.showingIconIndex=index;
}

-(void)setShowingIconAtIndex:(NSUInteger)index{
    self.showingIconIndex=index;
}

-(void)listShowAndDismiss{
    if(self.isShowing){
        [UIView animateWithDuration:animateDuration animations:^{
            for(UIButton *iconButton in self.buttons){
                iconButton.frame=CGRectMake(0.0f,-edgeLength, edgeLength, edgeLength);
            }
        } completion:^(BOOL finished) {
            for(UIButton *iconButton in self.buttons){
                [iconButton removeFromSuperview];
            }
            [self removeFromSuperview];
            self.isShowing=NO;
        }];
    }
    else{
        for(UIButton *iconButton in self.buttons){
            [self addSubview:iconButton];
        }
//        self.frame=CGRectMake(leftPadding, 0.0f, edgeLength, (edgeLength+verticalMargin)*self.buttons.count);
        self.frame=CGRectMake(leftPadding, 0.0f, [Screen width]-leftPadding, [Screen height]);
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(listShowAndDismiss)];
            [self addGestureRecognizer:tapGesture];
        });
        [self.parentView.rootView addSubview:self];
        
        [UIView animateWithDuration:animateDuration animations:^{
            for(NSUInteger itr=0;itr<self.buttons.count;++itr){
                UIButton *button=[self.buttons objectAtIndex:itr];
                button.frame=CGRectMake(0, (edgeLength+verticalMargin)*itr, edgeLength, edgeLength);
            }
        } completion:^(BOOL finished) {
            self.isShowing=YES;
        }];
        
    }
}

-(void)iconDidTouchedAtIndex:(UIButton*)sender{
    DLog(@"iconbutton didtouched ,tag:%li",(long)sender.tag);
}

@end
