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
        self.editable=NO;
    }
    return self;
}

-(void)setViewWithSocialLikesContainer:(SocialLikesContainer*)continer{
    NSMutableString *nameList=[[NSMutableString alloc]init];
    for(SocialLikesModal *modal in continer.aLikes){
        if(nameList.length==0){
            [nameList appendString:[NSString stringWithFormat:@"\\Usr:%@/Usr\\",modal.name]];
        }
        else{
            [nameList appendString:[NSString stringWithFormat:@" , \\Usr:%@/Usr\\",modal.name]];
        }
    }
    [self setRichText:nameList];
}



@end
