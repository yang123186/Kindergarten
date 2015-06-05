//
//  TextViewCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *textViewCellIdentifier=@"TextViewCell";

@interface TextViewCell : UITableViewCell

@property   (nonatomic,strong)  UITextView  *textField;


-(instancetype)init;


@end
