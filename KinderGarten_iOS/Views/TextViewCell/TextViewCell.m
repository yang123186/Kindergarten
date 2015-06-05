//
//  TextViewCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/26/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "TextViewCell.h"
#import "General.h"

@implementation TextViewCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textViewCellIdentifier]){
        self.textField=[[UITextView alloc]init];
        self.textField.translatesAutoresizingMaskIntoConstraints=NO;
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
        }];
    }
    return self;
}

    
    
@end
