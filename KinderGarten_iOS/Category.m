//
//  Category.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "Category.h"


@implementation UIView(CircleExtention)

-(void)setCircleRadius:(CGFloat)radius{
    self.layer.cornerRadius=radius;
    [self.layer setMasksToBounds:YES];
}

@end




@implementation NSString(LineTextViewExtention)

-(NSString*)userEasyKnowTimeFormat{
#warning the interface should be write
    return self;
}


-(NSString*)MD5Encrypt{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}


-(BOOL)checkWithRegularExpression:(NSString *)regularExpression{
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regularExpression];
    if([regex evaluateWithObject:self]){
        return YES;
    }
    else{
        return NO;
    }

}

@end



@implementation UITextField(PaddingPlus)

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


@end



@implementation MBProgressHUD(StringStyle)


+(void)showHUDWithString:(NSString*)string showingTime:(NSTimeInterval)timeInterval onView:(UIView*)view{
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.labelText=string;
    [hud hide:YES afterDelay:timeInterval];
}

@end
