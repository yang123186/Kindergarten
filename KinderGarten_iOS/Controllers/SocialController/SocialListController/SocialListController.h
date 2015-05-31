//
//  SocialListController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialListCell.h"
typedef enum : NSUInteger {
    HeadData,
    AppendData,
} DataType;


#define HEAD_DATA_TYPE -1

@interface SocialListController : UITableViewController<SocialLisrCellDelegate>

@end
