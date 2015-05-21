//
//  MainGroupView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MainGroupView.h"
#import "General.h"
#import "MainGroupButton.h"

static const    CGFloat paddingHorizontal=45.0f;
static const    CGFloat paddingVertical=10.0f;

static const    NSUInteger colNum=3;

@interface MainGroupView()

@property   (nonatomic,strong)  NSMutableArray  *buttons;
@property   (nonatomic,assign,readonly) NSInteger  number;

//@property   (nonatomic,assign,readonly) NSUInteger  restCol;
//@property   (nonatomic,assign,readonly) NSUInteger  row;
@end

@implementation MainGroupView

-(instancetype)initWithItemNumer:(NSUInteger)number icons:(NSArray*)icons titles:(NSArray*)titles{
    if(self=[super init]){
        _number=number;
//        _row=number/colNum;
//        _restCol=number%colNum;
//        if(self.restCol>0){
//            _row++;
//        }
        
        self.buttons=[[NSMutableArray alloc]init];
        [self subViewsInitializeWithIcons:icons titles:titles];
    }
    return self;
}


-(void)subViewsInitializeWithIcons:(NSArray*)icons titles:(NSArray*)titles{
    [self.buttons removeAllObjects];
    
    for(NSUInteger itr=0;itr<self.number;++itr){
        
        NSUInteger row=itr/colNum,col=itr%colNum;
        
        MainGroupButton *button=[[MainGroupButton alloc]initWithImage:[icons objectAtIndex:itr] title:[titles objectAtIndex:itr]];
        [self.buttons addObject:button];
        button.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:button];
        
        if(col==0){
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:paddingHorizontal]];
        }
        else{
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:[self.buttons objectAtIndex:itr-1] attribute:NSLayoutAttributeRight multiplier:1.0f constant:paddingHorizontal]];
        }
        if(row==0){
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:paddingVertical]];
        }
        else{
            [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[self.buttons objectAtIndex:(row-1)*colNum+col] attribute:NSLayoutAttributeBottom multiplier:1.0f constant:paddingVertical]];
        }
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:[MainGroupButton requireWidth]]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:[MainGroupButton requireHieght]]];
        

    }
}


-(CGFloat)height{
    NSInteger rowNum=(self.number-1)/colNum+1;
    return paddingVertical*(rowNum+1)+[MainGroupButton requireHieght]*rowNum;
}

@end
