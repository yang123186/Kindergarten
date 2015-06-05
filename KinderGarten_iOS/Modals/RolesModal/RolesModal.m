//
//  RolesModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RolesModal.h"

@implementation RolesModal

-(instancetype)init{
    if(self=[super init]){
        self.roles=[[NSMutableArray alloc]init];
    }
    return self;
}


-(instancetype)initWithArray:(NSArray *)array{
    for(NSString *role in array){
        [self.roles addObject:role];
    }
    return self;
}



@end
