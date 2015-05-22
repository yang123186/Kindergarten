//
//  SwitchCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SwitchCell.h"

@implementation SwitchCell

-(instancetype)initWithDefaultSwitchStatus:(BOOL)status{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:switchCellDefaultReuseIdentifier]){
        self.switchView=[[UISwitch alloc]init];
        [self.switchView setOn:status];
        [self.switchView addTarget:self action:@selector(switchChanged) forControlEvents:UIControlEventValueChanged];
        self.accessoryView=self.switchView;
    }
    return self;
}




-(void)switchChanged{
    if([self.delegate respondsToSelector:@selector(switchCell:didChangedSwitch:)]){
        [self.delegate switchCell:self didChangedSwitch:self.switchView.isOn];
    }
}

@end
