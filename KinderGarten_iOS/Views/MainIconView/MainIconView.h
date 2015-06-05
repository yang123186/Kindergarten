//
//  MainIconView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconList.h"

@protocol MainIconDelegate <NSObject>

-(void)listIconDidTouchedAtIndex:(NSUInteger)index;

@end


@interface MainIconView : UIBarButtonItem

@property   (nonatomic,weak)    UIView      *rootView;
@property   (nonatomic,weak)    id<MainIconDelegate>delegate;

- (instancetype)initWithImage:(UIImage *)image onView:(UIView*)view delegate:(id<MainIconDelegate>)delegate;



@end
