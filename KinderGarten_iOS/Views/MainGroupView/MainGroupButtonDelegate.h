//
//  MainGroupButtonDelegate.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

@class MainGroupView,MainGroupButton;
@protocol MainGroupViewDelegate <NSObject>

-(void)mainGroupView:(MainGroupView*)mainGroupView buttonDidTouched:(MainGroupButton*)button;

@end
