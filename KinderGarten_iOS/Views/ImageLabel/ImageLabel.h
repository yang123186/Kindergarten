//
//  ImageLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLabel : UIView

@property   (nonatomic,strong)  UIImageView *imageView;
@property   (nonatomic,strong)  UILabel     *textLabel;

-(instancetype)init;

+(CGFloat)height;
@end
