//
//  SocialListModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialListModal.h"
#import "General.h"

@implementation SocialListModal

-(instancetype)init{
    if(self=[super init]){
        if(!self.cComments){
            self.cComments=[[SocialCommentContainer alloc]init];
        }
        if(!self.cLikes){
            self.cLikes=[[SocialLikesContainer alloc]init];
        }
        if(!self.cClassInfo){
            self.cClassInfo=[[ClassLiteModal alloc]init];
        }
        
        if(!self.cUser){
            self.cUser=[[UserModal alloc]init];
        }
    }
    return self;
}



-(instancetype)initWithSocialDictionary:(NSDictionary *)dictionary{
    if(self=[self init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"comments"]){
        self.cComments=[self.cComments initWithSocialCommentsArray:value];
    }
    else if([key isEqualToString:@"likes"]){
        self.cLikes=[self.cLikes initWithSocialLikesArray:value];
    }
    else if([key isEqualToString:@"classInfo"]){
        self.cClassInfo=[self.cClassInfo initWithClassDictionary:value];
    }
    else if([key isEqualToString:@"user"]){
        self.cUser=[self.cUser initWithDictionary:value];
    }
    else if([key isEqualToString:@"id"]){
        //do nothing
    }
    else if([key isEqualToString:@"class"]){
        self.theClass=value;
    }
    else{
        DLog(@"SocialListModal: unknow key:%@",key);
    }
}

@end



@implementation SocialListContainer

-(instancetype)init{
    if(self=[super init]){
        if(self.aSocials){
            [self.aSocials removeAllObjects];
        }
        else{
            self.aSocials=[[NSMutableArray alloc]initWithCapacity:1];
        }
    }
    return self;
}


-(instancetype)initWithSocialsArray:(NSArray *)array{
    if(self=[self init]){
        for(NSDictionary *dic in array){
            SocialListModal *modal=[[SocialListModal alloc]initWithSocialDictionary:dic];
            [self.aSocials addObject:modal];
        }
    }
    return self;
}

-(instancetype)initWithAppendArray:(NSArray *)array{
    for(NSDictionary *dic in array){
        SocialListModal *modal=[[SocialListModal alloc]initWithSocialDictionary:dic];
        [self.aSocials addObject:modal];
    }
    return self;
}

-(SocialListModal*)socialListModalAtIndex:(NSUInteger)index{
    return [self.aSocials objectAtIndex:index];
}

@end