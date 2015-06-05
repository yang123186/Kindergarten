//
//  LineLabel.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/16/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineLabel : UILabel

@property(nonatomic) UIEdgeInsets insets;


/**
 *  Let the Label have edge inset.
 *
 *  @param insets The inset the label should have
 *
 *  @return LineLabel instance.
 */
-(instancetype) initWithInsets: (UIEdgeInsets) insets;
@end
