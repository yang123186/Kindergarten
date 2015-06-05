//
//  Screen.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/22/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "Screen.h"

@implementation Screen

+(CGFloat)height{
    return [UIScreen mainScreen].bounds.size.height;
}

+(CGFloat)width{
    return [UIScreen mainScreen].bounds.size.width;
}

+(CGRect)bounds{
    return [UIScreen mainScreen].bounds;
}

+(CGFloat)topBarHeight{
    return 64.0f;
}

@end
