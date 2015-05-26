//
//  ColorDefine.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//


#define COLOR_MANAGER(R,G,B,ALPHA)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:ALPHA]

#define CLEAR_COLOR         [UIColor clearColor]
#define BLACK_COLOR         COLOR_MANAGER(0.0f,0.0f,0.0f,1.0f)
#define WHITE_COLOR         COLOR_MANAGER(255.0f,255.0f,255.0f,1.0f)
#define PINK_COLOR          COLOR_MANAGER(254.0f,101.0f,115.0f,1.0f)
#define GRAY_BACKGROUND     COLOR_MANAGER(240.0f,240.0f,242.0f,1.0f)
#define BLUE_NAME           COLOR_MANAGER(255,0,0,1.0f)