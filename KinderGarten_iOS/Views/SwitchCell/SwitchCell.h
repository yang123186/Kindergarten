//
//  SwitchCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/21/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *switchCellDefaultReuseIdentifier=@"SWITCH_CELL";

@class SwitchCell;
@protocol SwitchCellDelegate <NSObject>

-(void)switchCell:(SwitchCell*)cell didChangedSwitch:(BOOL)newStat;

@end

@interface SwitchCell : UITableViewCell

@property   (nonatomic,weak)    id<SwitchCellDelegate> delegate;

@property   (nonatomic,strong)  UISwitch    *switchView;

-(instancetype)initWithDefaultSwitchStatus:(BOOL)status;
@end
