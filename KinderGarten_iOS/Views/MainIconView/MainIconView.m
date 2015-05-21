//
//  MainIconView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "MainIconView.h"
#import "General.h"
#import "IconList.h"


@interface MainIconView()

@property   (nonatomic,strong)  UIImage     *customImage;
@property   (nonatomic,strong)  UIButton    *customButton;


@property   (nonatomic,strong)  IconList    *iconList;

@end


@implementation MainIconView


- (instancetype)initWithImage:(UIImage *)image onView:(UIView *)view delegate:(id<MainIconDelegate>)delegate {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, edgeLength, edgeLength)];
    [btn addTarget:self action:@selector(barIconDidTouched) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:image forState:UIControlStateNormal];
    btn.layer.cornerRadius=edgeLength/2;
    [btn.layer setMasksToBounds:YES];

    if(self=[super initWithCustomView:btn]){
        self.customButton = btn;
        self.customImage = image;
        self.rootView=view;
        self.delegate=delegate;
        
        /********TestArea********/
        NSArray *a=[NSArray arrayWithObjects:[UIImage imageNamed:@"testimg"],[UIImage imageNamed:@"appbar.arrow.down.up.999999"],[UIImage imageNamed:@"20131220222849-1195882039"],[UIImage imageNamed:@"2D_code_ffffff"], nil];
        /********TestArea********/

        self.iconList=[[IconList alloc]initWithSuperView:self Icons:a];
    }
    

    return self;
}



- (void)setCustomImage:(UIImage *)image {
    _customImage = image;
    [_customButton setImage:image forState:UIControlStateNormal];
}



-(void)barIconDidTouched{
    DLog(@"didtouched");
    [self.iconList listShowAndDismiss];
}

@end
