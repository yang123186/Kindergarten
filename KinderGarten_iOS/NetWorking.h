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
#define BASEURL                                                         @"http://kdgtapi.hrsoft.net"

#define PUREPATH(PATH)                                                  [NSString stringWithFormat:@"%@%@",BASEURL,PATH]
#define PATH_AND_PARAMETER(PATH,PARAMETER)                              [NSString stringWithFormat:@"%@%@%@",BASEURL,PATH,PARAMETER]

#define LOGIN_PATH                                                      PUREPATH(@"/auth/login")
#define FORGET_PASSWORD_PATH                                            PUREPATH(@"/auth/forgetpassword")

#endif


#ifndef HTTP_STAT
#define HTTP_STAT

#define AUTHENTICATED_SUCCESS  200
#define AUTHENTICATED_FAIL     401 //Password or Account may be wrong.
#define BAD_REQUEST            400

#endif




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







