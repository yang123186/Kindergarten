//
//  SocialListModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocialCommentContainer.h"
#import "SocialLikesModal.h"
#import "ClassLitemodal.h"
#import "UserModal.h"

@interface SocialListModal : NSObject

@property   (nonatomic,strong)  NSString    *_id;
@property   (nonatomic,strong)  NSString    *content;
@property   (nonatomic,strong)  NSString    *theClass;//class
@property   (nonatomic,assign)  NSInteger   __v;
@property   (nonatomic,strong)  NSString    *timestamp;
@property   (nonatomic,strong)  NSArray     *to;
@property   (nonatomic,strong)  SocialCommentContainer  *cComments;
@property   (nonatomic,strong)  SocialLikesContainer    *cLikes;
@property   (nonatomic,strong)  NSArray     *audios;
@property   (nonatomic,strong)  NSArray     *videoThumbs;
@property   (nonatomic,strong)  NSArray     *videos;
@property   (nonatomic,strong)  NSArray     *thumbs;
@property   (nonatomic,strong)  NSArray     *pictures;
@property   (nonatomic,strong)  ClassLiteModal  *cClassInfo;
@property   (nonatomic,strong)  UserModal   *cUser;

-(instancetype)init;
-(instancetype)initWithSocialDictionary:(NSDictionary*)dictionary;

@end


@interface SocialListContainer : NSObject

@property   (nonatomic,strong)  NSMutableArray  *aSocials;

-(instancetype)init;

-(instancetype)initWithSocialsArray:(NSArray*)array;

-(SocialListModal*)socialListModalAtIndex:(NSUInteger)index;

-(instancetype)initWithAppendArray:(NSArray*)array;

@end
