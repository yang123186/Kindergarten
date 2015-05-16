//
//  NetWorking.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "NetWorking.h"

@implementation AFHTTPRequestOperationManager (NetWorking)

-(void)beJsonManager{
    self.requestSerializer=[AFJSONRequestSerializer serializer];
    self.responseSerializer=[AFJSONResponseSerializer serializer];
}

-(void)setCommonlyUsedRequsetHeaderFiled{
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:@"application/json;charset=utf8" forHTTPHeaderField:@"Content-Type"];
}

@end
