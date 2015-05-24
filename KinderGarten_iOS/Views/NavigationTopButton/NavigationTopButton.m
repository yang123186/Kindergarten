//
//  NavigationTopButton.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "NavigationTopButton.h"
#import "General.h"


static const CGFloat    buttonHeight=40.0f;
static  const   CGFloat lineHeight=4.0f;


@interface NavigationTopButton ()

@property   (nonatomic,strong)  NSMutableArray  *buttons;
@property   (nonatomic,strong)  UIView          *indicateLine;

@end


@implementation NavigationTopButton

-(instancetype)initWithButtonNumber:(NSUInteger)number{
    if(self=[super init]){
        _buttonNumber=number;
        self.buttons=[[NSMutableArray alloc]init];
        self.layer.backgroundColor=BACKGROUND_GRAY.CGColor;
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    [self.buttons removeAllObjects];
    CGFloat buttonWidth=[Screen width]/self.buttonNumber;
    for(NSUInteger itr=0;itr<self.buttonNumber;++itr){
        UIButton *button=[[UIButton alloc]init];
        button.tag=itr;
        [button addTarget:self action:@selector(navigationButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        button.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:button];
        [self.buttons addObject:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(buttonWidth*itr);
            make.top.equalTo(self.mas_top);
            make.width.equalTo([NSNumber numberWithDouble:buttonWidth]);
            make.height.equalTo([NSNumber numberWithDouble:buttonHeight]);
        }];
    }
    
        
        self.indicateLine=[[UIView alloc]init];
//        self.indicateLine.translatesAutoresizingMaskIntoConstraints=NO;
        self.indicateLine.layer.backgroundColor=PINK_COLOR.CGColor;
        self.indicateLine.frame=CGRectMake(0, buttonHeight, buttonWidth, lineHeight);
        [self addSubview:self.indicateLine];
        
//        [self.indicateLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_top).with.offset(buttonHeight);
//            make.left.equalTo(self.mas_left);
//            make.width.equalTo([NSNumber numberWithDouble:buttonWidth]);
//            make.height.equalTo([NSNumber numberWithDouble:lineHeight]);
//        }];
//    }
}


-(void)navigationButtonTouched:(UIButton*)sender{
    [UIView animateWithDuration:0.3f animations:^{
        self.indicateLine.frame=CGRectMake([Screen width]/self.buttonNumber*sender.tag, buttonHeight, [Screen width]/self.buttonNumber, lineHeight);

//        [self.indicateLine mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset([Screen width]/self.buttonNumber*sender.tag);
//        }];
    }];
    
    if([self.delegate respondsToSelector:@selector(buttonTouchedAtIndex:)]){
        [self.delegate buttonTouchedAtIndex:sender.tag];
    }
}


-(void)setTitlesWithArray:(NSArray *)array{
    for(NSUInteger itr=0;itr<self.buttons.count;++itr){
        UIButton *button=[self.buttons objectAtIndex:itr];
        [button setTitle:[array objectAtIndex:itr] forState:UIControlStateNormal];
    }
}


+(CGFloat)height{
    return buttonHeight+lineHeight;
}

@end
