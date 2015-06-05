//
//  FlowerCollectionCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalFlowerModal.h"

static const CGFloat    flowerCollectionCellHeight=125.0f;
static const CGFloat    flowerCollectionCellWidth=100.0f;
static NSString *FlowerCollectionCellIdentifier=@"FlowerCollectionCell";


@interface FlowerCollectionCell : UICollectionViewCell

@property   (nonatomic,strong)  UIImageView *imageView;
@property   (nonatomic,strong)  UILabel     *nameLabel;
@property   (nonatomic,strong)  UILabel     *flowerNumberLbel;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)setViewForModal:(PersonalFlowerModal*)modal;
-(void)setViewForImageUrl:(NSString*)url nameLabelText:(NSString*)name;
@end
