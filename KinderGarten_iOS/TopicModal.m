//
//  TopicModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "TopicModal.h"
#import "General.h"
//@implementation TopicOptionsModal
//
//-(instancetype)init{
//    if(self=[super init]){
//        //Do nothing.
//    }
//    return self;
//}
//
//-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
//    [self setValuesForKeysWithDictionary:dictionary];
//    return self;
//}
//
//@end


@implementation TopicModal

-(instancetype)init{
    if(self=[super init]){
//        self.cOptions=[[TopicOptionsModal alloc]init];
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    DLog(@"TopicModal find undefined key:%@",key);
}

@end
