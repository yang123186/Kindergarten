//
//  GObserver.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "GObserver.h"

@implementation GObserver

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"cookies"]){
        NSLog(@"cookies changed!:%@",[NSHTTPCookieStorage  sharedHTTPCookieStorage].cookies);
    }
}

@end

