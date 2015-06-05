//
//  SocialCommentContainer.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModal.h"
@interface SocialCommentModal : NSObject
@property   (nonatomic,strong)  NSString    *content;
@property   (nonatomic,strong)  NSString    *time;
@property   (nonatomic,strong)  NSString    *_id;
@property   (nonatomic,strong)  UserModal   *cUserBrief;

-(instancetype)init;

-(instancetype)initWithSocialCommentDictionary:(NSDictionary*)dictionary;

@end


@interface SocialCommentContainer : NSObject

@property   (nonatomic,strong) NSMutableArray   *aComments;

-(instancetype)init;

-(instancetype)initWithSocialCommentsArray:(NSArray*)array;

-(SocialCommentModal*)modalAtIndex:(NSUInteger)index;

@end
