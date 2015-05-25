//
//  MediaView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaView : UIView

@property   (nonatomic,assign,readonly) CGFloat height;

-(instancetype)init;

-(instancetype)initWithMediaArray:(NSArray*)array;

-(void)setViewForArray:(NSArray*)array;

@end
