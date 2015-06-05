//
//  RecipeCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealModal.h"


typedef enum : NSUInteger {
    breakfast=1,
    breakfastPlus=2,
    lunch=3,
    afternoonPlus=4,
    dinner=5
} MealType;


static NSString* const RecipeCellIdentifier=@"RecipeCell";

@interface RecipeCell : UITableViewCell

@property   (nonatomic,strong)  UILabel *titleLabel;

-(instancetype)init;

-(void)setViewForModal:(MealModal*)modal;

+(CGFloat)heightWithPicNumber:(NSInteger)numeber;

@end
