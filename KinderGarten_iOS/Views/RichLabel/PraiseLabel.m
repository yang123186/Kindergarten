//
//  PraiseLabel.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/25/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "PraiseLabel.h"
#import "SocialListModal.h"
#import "General.h"
@implementation PraiseLabel

-(instancetype)init{
    if(self=[super init]){
//        self.editable=NO;
//        self.delegate=self;
//        self.scrollEnabled=NO;
//        self.selectable=YES;
//        self.userInteractionEnabled=NO;
    }
    return self;
}


-(void)setViewWithSocialLikesContainer:(SocialLikesContainer*)continer{
    NSMutableAttributedString *nameList=[[NSMutableAttributedString alloc]init];
    for(SocialLikesModal *modal in continer.aLikes){
        if(nameList.length==0){
//            NSURL *userUrl=[NSURL URLWithString:USER_URL(modal._id)];
            NSURL *userUrl=[NSURL URLWithString:@"http://baidu.com"];
            NSAttributedString *nameAttStr=[[NSAttributedString alloc]initWithString:modal.name attributes:@{ NSLinkAttributeName: userUrl,NSFontAttributeName :[UIFont boldSystemFontOfSize:30.0f]}];
            [nameList appendAttributedString:nameAttStr];
//            [nameList appendString:[NSString stringWithFormat:@"Usr:%@/Usr",modal.name]];
        }
        else{
//            [nameList appendString:[NSString stringWithFormat:@" , Usr:%@/Usr",modal.name]];
        }
    }
    [self setAttributedText:nameList];
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    NSLog(@"textView is clicked...");
    return YES;
}


@end
