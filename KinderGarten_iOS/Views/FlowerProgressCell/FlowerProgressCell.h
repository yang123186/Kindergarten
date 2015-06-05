//
//  FlowerProgressCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* const flowerProgressCellIdentifier=@"FlowerProgressCell";

@interface FlowerProgressCell : UITableViewCell

@property   (nonatomic,strong)  UIProgressView  *progressView;
@property   (nonatomic,strong)  UILabel         *flowerNameLabel;
@property   (nonatomic,strong)  UILabel         *flowerNumberLabel;

-(instancetype)init;

+(CGFloat)height;
@end
