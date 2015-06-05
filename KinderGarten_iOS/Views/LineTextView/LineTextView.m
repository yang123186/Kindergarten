//
//  LineTextView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "LineTextView.h"
#import "General.h"




@implementation LineTextView

-(instancetype)initWithHorizontalPadding:(CGFloat)padding{
    if(self=[super init]){
        [self setHorizontalPadding:padding];
    }
    return self;
}

-(instancetype)init{
    self=[self initWithHorizontalPadding:0.0f];
    return self;
}



-(NSString*)MD5Value{
    return self.text.MD5Encrypt;
}

@end
