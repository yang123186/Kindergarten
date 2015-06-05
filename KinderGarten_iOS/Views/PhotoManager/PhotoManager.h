//
//  PhotoManager.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/28/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoManagerDelegate <NSObject>

-(void)shouldAddPhotos;

@end


@interface PhotoManager : UIView

@property   (nonatomic,strong)  NSMutableArray  *imageContainer;
@property   (nonatomic,weak)    id<PhotoManagerDelegate>    delegate;

-(instancetype)init;

-(void)addNewPhoto;



@end
