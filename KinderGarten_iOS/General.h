//
//  General.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/15/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//


#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#else
#define DLog(...)
#endif


#define  REGULAR_EXPRESSION_MOBILE_PHONE @"^1\\d{10}"
#define  REGULAR_EXPRESSION_PASSWORD    @"\\w{6,16}"


#warning teacher is test.should be change to parent.
static NSString *loginTypeValue=@"teacher";
