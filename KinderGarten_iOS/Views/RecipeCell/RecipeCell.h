//
//  RecipeCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/29/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* const RecipeCellIdentifier=@"RecipeCell";

@interface RecipeCell : UITableViewCell

@property   (nonatomic,strong)  UILabel *titleLabel;

-(instancetype)init;

+(CGFloat)heightWithPicNumber:(NSInteger)numeber;

@end
