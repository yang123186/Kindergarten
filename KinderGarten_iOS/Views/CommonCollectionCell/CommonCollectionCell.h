//
//  CommonCollectionCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CommonCollectionCell : UICollectionViewCell

@property   (nonatomic,strong)  UIImageView *imageView;
@property   (nonatomic,strong)  UILabel     *textLabel;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)setViewImageWithURL:(NSString*)url text:(NSString*)text;


+(CGFloat)height;

+(CGFloat)width;
@end
