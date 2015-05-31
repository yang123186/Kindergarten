//
//  SocialListController.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialListCell.h"
#import "SocialListViewController.h"

typedef enum : NSUInteger {
    HeadData,
    AppendData,
} DataType;


#define HEAD_DATA_TYPE -1

@interface SocialListController : UIViewController<SocialLisrCellDelegate>
@property   (nonatomic,assign)  BOOL                isLoading;
@property   (nonatomic,strong)  NSMutableArray      *cellStorage;
@property   (nonatomic,strong)  SocialListViewController    *viewController;

-(void)requestSocialDatasWithTimeStamp:(NSInteger)timeStampInt;
-(instancetype)init;

@end
