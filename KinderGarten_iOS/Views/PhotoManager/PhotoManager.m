//
//  PhotoManager.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PhotoManager.h"
#import "General.h"

static const    CGFloat paddingHorizontal=15.0f;
static const    CGFloat paddingVertical=10.0f;
static CGFloat  buttonEdgeLength;

static const NSInteger  colNum=3;

@interface PhotoManager()

@property   (nonatomic,strong)  NSMutableArray  *buttonArray;
@end

@implementation PhotoManager

-(instancetype)init{
    if(self=[super init]){
        buttonEdgeLength=([Screen width]-(colNum+1)*paddingHorizontal)/3;
        self.imageContainer=[[NSMutableArray alloc]initWithCapacity:0];
        self.buttonArray=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

//-(void)createView{
//    UIButton *button=[[UIButton alloc]init];
//    [button setImage:[UIImage imageNamed:@"ebg"] forState:UIControlStateNormal];
//    button.tag=0;
//    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
//    button.translatesAutoresizingMaskIntoConstraints=NO;
//    [self addSubview:button];
//    button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).with.offset(paddingVertical);
//        make.left.equalTo(self.mas_left);
//        make
//    }
//}


-(void)buttonTouched:(UIButton*)sender{
    
}

@end
