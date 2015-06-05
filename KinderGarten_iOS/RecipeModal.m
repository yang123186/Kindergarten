//
//  RecipeModal.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RecipeModal.h"
#import "General.h"


@implementation RecipeModal

-(instancetype)init{
    if (self=[super init]) {
        self.cMeals=[[MealContainer alloc]init];
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if(self=[self init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"meals"]){
        self.cMeals=[self.cMeals initWithArray:value];
    }
    else{
        DLog(@"RecipeModal:unknow key :%@ ",key);
    }
}

@end
