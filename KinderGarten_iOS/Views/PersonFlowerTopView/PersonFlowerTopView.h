//
//  PersonFlowerTopView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonFlowerTopView : UIView

@property   (nonatomic,strong)  UIImageView *icon;
@property   (nonatomic,strong)  UIButton    *sendFlowerButton;
@property   (nonatomic,strong)  UILabel     *flowerNumberLabel;

-(instancetype)init;

@end
