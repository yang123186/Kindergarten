//
//  LineTextView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "LineTextView.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString(LineTextViewExtention)

-(NSString*)MD5Encrypt{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end



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


-(void)setLeftPadding:(CGFloat)padding{
    if(!self.leftView){
        self.leftView =[[UIView alloc]init];
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    CGRect leftFrame=self.frame;
    leftFrame.size.width=padding;
    self.leftView.frame=leftFrame;
}

-(void)setRightPadding:(CGFloat)padding{
    if(!self.rightView){
        self.rightView=[[UIView alloc]init];
        self.rightViewMode=UITextFieldViewModeAlways;
    }
    
    CGRect rightFrame=self.frame;
    rightFrame.size.width=padding;
    rightFrame.origin.x=self.frame.origin.x+self.frame.size.width-rightFrame.size.width;
    self.rightView.frame=rightFrame;
}

-(void)setHorizontalPadding:(CGFloat)padding{
    [self setLeftPadding:padding];
    [self setRightPadding:padding];

}



-(NSString*)MD5Value{
    return self.text.MD5Encrypt;
}

@end
