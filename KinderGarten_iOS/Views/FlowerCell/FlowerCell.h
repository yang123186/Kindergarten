//
//  FlowerCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalFlowerModal.h"

static NSString *FlowerCellIdentifier=@"FlowerCell";

@interface FlowerCell : UITableViewCell


@property   (nonatomic,strong)  UILabel *nameLabel;
@property   (nonatomic,strong)  UILabel *flowerNameLabel;
@property   (nonatomic,strong)  UILabel *timeLabel;
@property   (nonatomic,strong)  UIImageView *flowerImageView;
@property   (nonatomic,strong)  UIImageView *childImageView;


-(instancetype)init;

-(void)setViewForModal:(PersonalFlowerModal*)modal;

+(CGFloat)height;

@end
