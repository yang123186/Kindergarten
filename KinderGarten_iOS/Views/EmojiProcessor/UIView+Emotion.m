//
//  UIView+Emotion.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/23/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "UIView+Emotion.h"
#import "General.h"

static NSDictionary  *emotionDic;
static NSRegularExpression *emotionRegularExpression;
static NSString *emotionPattern=@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
static NSRegularExpression  *nameRegularExpression;
static NSString *namePattern=@"Usr:[a-zA-Z0-9\\u4e00-\\u9fa5]+/Usr";
static NSDictionary *emotionDictionary;



@implementation UIView(Emotion)


+(void)regularExpressionInitialize{
    static dispatch_once_t rEonceToken;
    dispatch_once(&rEonceToken, ^{
        NSError *error=nil;
        emotionRegularExpression=[NSRegularExpression regularExpressionWithPattern:emotionPattern options:NSRegularExpressionCaseInsensitive error:&error];
        if(!emotionRegularExpression){
            DLog(@"emotionProcessor:initialize emotionRegularPexression error!");
        }
        nameRegularExpression=[NSRegularExpression regularExpressionWithPattern:namePattern options:NSRegularExpressionCaseInsensitive error:&error];
        if(!nameRegularExpression){
            DLog(@"emotionProcessor:initialize nameRegularPexression error!");
        }
    });
}

+(void)emotionDictionaryInitialize{
    static dispatch_once_t dicOnceToken;
    dispatch_once(&dicOnceToken, ^{
        NSString *file=[[NSBundle mainBundle]pathForResource:@"emotionFaces" ofType:@"plist"];
        emotionDic=[[NSDictionary alloc]initWithContentsOfFile:file];
    });
}



+(NSAttributedString*)createEmotionStringWithText:(NSString *)text{
    [[self class] regularExpressionInitialize];
    [[self class] emotionDictionaryInitialize];
    NSMutableAttributedString *attributeString=[[NSMutableAttributedString alloc]initWithString:text];
    
    NSArray *nameResultArray=[nameRegularExpression matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    for(NSTextCheckingResult *match in nameResultArray){
        [attributeString setAttributes:@{NSForegroundColorAttributeName :BLUE_NAME} range:[match range]];
    }
    
    NSArray *emotionResultArray=[emotionRegularExpression matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    NSMutableArray *imageArray=[NSMutableArray arrayWithCapacity:emotionResultArray.count];
    
    for(NSTextCheckingResult *match in emotionResultArray){
        NSRange range=[match range];
        NSString *subStr=[text substringWithRange:range];
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.bounds = CGRectMake(textAttachment.bounds.origin.x, textAttachment.bounds.origin.y - 5, 25, 25);
        
        //给附件添加图片
        textAttachment.image = [UIImage imageNamed:[emotionDic objectForKey:subStr]];
        
        //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
        NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
        
        //把图片和图片对应的位置存入字典中
        NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
        [imageDic setObject:imageStr forKey:@"image"];
        [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
        
        //把字典存入数组中
        [imageArray addObject:imageDic];
        
    }
    
    
    //从后往前替换
    for (NSInteger i = imageArray.count - 1; i >= 0; i--)
    {
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        //进行替换
        [attributeString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
        
    }
    [attributeString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.f]} range:NSMakeRange(0, attributeString.length)];
    return attributeString;
}

-(void)setRichText:(NSString*)text{
    NSAttributedString *emotionStr=[[self class]createEmotionStringWithText:text];
    if([self isKindOfClass:[UILabel class]]){
        [((UILabel*)self) setAttributedText:emotionStr];
        return;
    }
    
    if([self isKindOfClass:[UITextField class]]){
        [((UITextField*)self) setAttributedText:emotionStr];
        return;
    }
    
    if([self isKindOfClass:[UIButton class]]){
        [((UIButton*)self) setAttributedTitle:emotionStr forState:UIControlStateNormal];
        return;
    }
    
    if([self isKindOfClass:[UITextView class]]){
        [((UITextView*)self) setAttributedText:emotionStr];
        return;
    }
    
}

@end
