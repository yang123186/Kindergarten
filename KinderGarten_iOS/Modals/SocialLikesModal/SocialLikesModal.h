//
//  SocialLikesModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialLikesModal : NSObject

@property   (nonatomic,strong)  NSString    *avatar;
@property   (nonatomic,strong)  NSString    *name;
@property   (nonatomic,strong)  NSString    *user;
@property   (nonatomic,strong)  NSString    *appellation;
@property   (nonatomic,strong)  NSString    *_id;


-(instancetype)init;

-(instancetype)initWithSocialLikeDictionary:(NSDictionary*)dictionary;

@end


@interface SocialLikesContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *aLikes;

-(instancetype)init;

-(instancetype)initWithSocialLikesArray:(NSArray*)array;

-(SocialLikesModal*)modalAtIndex:(NSUInteger)index;

@end