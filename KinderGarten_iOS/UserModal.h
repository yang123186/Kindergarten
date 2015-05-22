//
//  UserModal.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentsModal.h"
#import "RolesModal.h"
#import "ClassLitemodal.h"
#import "UserSettingModal.h"



static  NSString    *timeFormat=@"yyyy-MM-ddTHH:mm:ssZ";

@class StudentsContainer,RolesModal,ClassLiteModal,UserSettingModal;



@interface UserModal : NSObject

@property   (nonatomic,copy)    NSString    *_id;
@property   (nonatomic,copy)    NSString    *phone;
@property   (nonatomic,copy)    NSString    *name;
@property   (nonatomic,assign)  NSInteger   __v;
@property   (nonatomic,copy)    NSString    *avatar;
@property   (nonatomic,copy)    NSString    *sex;
@property   (nonatomic,copy)    NSString    *kindergarten;
@property   (nonatomic,copy)    NSString    *createTime;
@property   (nonatomic,strong)  ClassLiteModal  *cClasses;
@property   (nonatomic,strong)  StudentsContainer   *cStudents;
@property   (nonatomic,strong)  RolesModal  *cRoles;
@property   (nonatomic,strong)  UserSettingModal    *settingModal;

/**
 *  Base initialize ,it's safe to use.
 *
 *  @return A UserModal instance.
 */
-(instancetype)init;


/**
 *  Used in KVO,not a initialize method!be careful!
 *
 *  @param dictionary A Json type dictionary.
 *
 *  @return A UserModal instance.
 */
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
