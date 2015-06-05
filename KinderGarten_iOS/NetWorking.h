//
//  NetWorking.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "AFNetworking.h"

#ifndef KDGT_DOMAIN
#define KDGT_DOMAIN                                                     @"kdgtapi.hrsoft.net"
//#define BASEURL                                                         @"http://kdgtapi.hrsoft.net"
//#define BASEURL                                                         @"http://192.168.16.60:3000"
#define BASEURL                                                         @"http://jasonz93.xicp.net:3000"

#define PUREPATH(PATH)                                                  [NSString stringWithFormat:@"%@%@",BASEURL,PATH]
#define PATH_AND_PARAMETER(PATH,PARAMETER)                              [NSString stringWithFormat:@"%@%@%@",BASEURL,PATH,PARAMETER]

#define LOGIN_PATH                                                      PUREPATH(@"/auth")
#define FORGET_PASSWORD_PATH                                            PUREPATH(@"/auth/forgetpassword")
#define HOME_PATH                                                       PUREPATH(@"/user/home")
#define MODIFY_PASSWORD_PATH                                            PUREPATH(@"/user/password")
#define FEED_BACK_PATH                                                  PUREPATH(@"/system/advice")
#define SOCIAL_LIST_PATH                                                PUREPATH(@"/social")
#define SOCIAL_PRAISE_PATH(SOCIAL_ID)                                   [NSString stringWithFormat:@"%@/social/%@/like",BASEURL,SOCIAL_ID]
#define ATTENDANCE_LIST_PATH(TIME_STAMP)                                PATH_AND_PARAMETER(@"/attendance?timestamp=",TIME_STAMP)
#define DAYOFF_REQUEST_PATH                                             PUREPATH(@"/leave")
//#define TODAY_HONOR_LIST_PATH(TIME_STAMP)                               PATH_AND_PARAMETER(@"/flower/today?timestamp=",TIME_STAMP)
#define WEEK_HONOR_LIST_PATH(TIME_STAMP)                                PATH_AND_PARAMETER(@"/flower/week?timestamp=",TIME_STAMP)
#define MONTH_HONOR_LIST_PATH(TIME_STAMP)                               PATH_AND_PARAMETER(@"/flower/month?timestamp=",TIME_STAMP)
#define STUDENTS_LIST_PATH                                              @"http://1.r7test.sinaapp.com/namelist.json"
//#define FLOWER_LIST_PATH                                                PUREPATH(@"/flower/available")
#define FLOWER_LIST_PATH                                                @"http://1.r7test.sinaapp.com/flower.json"
#define ASSIGN_FLOWER_PATH(FLOWER_ID,STUDENT_ID)                        [NSString stringWithFormat:@"/flower/%@/student/%@",FLOWER_ID,STUDENT_ID]
#define RECIPRE_PATH(OFFSET)                                            PATH_AND_PARAMETER(@"/receipe/",OFFSET)
#define SCHEDULE_PATH(OFFSET)                                           PATH_AND_PARAMETER(@"/schedule/",OFFSET)


#define TODAY_HONOR_LIST_PATH(TIME_STAMP)                               @"http://1.r7test.sinaapp.com/coll.json"

#endif


#ifndef HTTP_STAT
#define HTTP_STAT

#define AUTHENTICATED_SUCCESS  200
#define REQUEST_SUCCESS        201
#define AUTHENTICATED_FAIL     401 //Password or Account may be wrong.
#define VERIFYCODE_WRONG       401
#define BAD_REQUEST            400
#define PASSWORD_WRONG         403
#define USER_UNSEARCHED        404
#define REMOTE_SERVER_ERROR    500

#endif

#define USER_URL_PREFIX     @"User://"
#define USER_URL(USER_ID)   [NSString stringWithFormat:@"%@%@",USER_URL_PREFIX,USER_ID]



@interface AFHTTPRequestOperationManager(JsonManager)

/**
 *  The default requestSerializer and responseSerializer is not AFJSONRequestSerializer,so use this method to set these serializers to be AFJSONRequestSerializer.
 */
-(void)beJsonManager;


/**
 *  Set commonly require request headers into Header filed.
 */
-(void)setCommonlyUsedRequsetHeaderFiled;


@end







