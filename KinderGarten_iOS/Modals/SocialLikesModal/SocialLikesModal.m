//
//  SocialLikesModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialLikesModal.h"
#import "General.h"
@implementation SocialLikesModal

-(instancetype)init{
    if(self=[super init]){
    }
    return self;
}

-(instancetype)initWithSocialLikeDictionary:(NSDictionary *)dictionary{
    if(self=[self init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"id"]){
        //I  know,do nothing
    }
    else{
        DLog(@"SocialLikesModal:Unknow key%@",key);
    }
}

@end


@implementation SocialLikesContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.aLikes){
            [self.aLikes removeAllObjects];
        }
        else{
            self.aLikes=[[NSMutableArray alloc]initWithCapacity:1];
        }
    }
    return self;
}


-(instancetype)initWithSocialLikesArray:(NSArray *)array{
    for(NSDictionary *dic in array){
        SocialLikesModal *modal=[[SocialLikesModal alloc]initWithSocialLikeDictionary:dic];
        [self.aLikes addObject:modal];
    }
    return self;
}

-(SocialLikesModal*)modalAtIndex:(NSUInteger)index{
    return [self.aLikes objectAtIndex:index];
}

@end
