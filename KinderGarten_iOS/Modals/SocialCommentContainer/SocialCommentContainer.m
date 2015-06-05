//
//  SocialCommentContainer.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialCommentContainer.h"
#import "General.h"
@implementation SocialCommentModal

-(instancetype)init{
    if(self=[super init]){
        self.cUserBrief=[[UserModal alloc]init];
    }
    return self;
}

-(instancetype)initWithSocialCommentDictionary:(NSDictionary *)dictionary{
    if(self=[self init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"userBrief"]){
        self.cUserBrief=[self.cUserBrief initWithDictionary:value];
    }
    else if([key isEqualToString:@"id"]){
        //OK,I know ,don't bird it.
    }
    else{
        DLog(@"SocialCommentModal:Unknow key:%@",key);
    }
}

@end


@implementation SocialCommentContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.aComments){
            [self.aComments removeAllObjects];
        }
        else{
            self.aComments=[[NSMutableArray alloc]initWithCapacity:1];
        }
    }
    return self;
}


-(instancetype)initWithSocialCommentsArray:(NSArray *)array{
    if(self=[self init]){
        for(NSDictionary *dic in array){
            SocialCommentModal *modal=[[SocialCommentModal alloc]initWithSocialCommentDictionary:dic];
            [self.aComments addObject:modal];
        }
    }
    return self;
}

-(SocialCommentModal*)modalAtIndex:(NSUInteger)index{
    return [self.aComments objectAtIndex:index];
}

@end
