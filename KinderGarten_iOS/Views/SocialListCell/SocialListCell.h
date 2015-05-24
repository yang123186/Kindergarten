//
//  SocialListCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaView.h"
#import "praiseBar.h"
#import "commentGroupView.h"

static NSString *socialListCellIdentifier=@"SOCIAL_LIST_CELL";

@interface SocialListCell : UITableViewCell

@property   (nonatomic,strong)  UIImageView *icon;
@property   (nonatomic,strong)  UILabel     *nameLabel;
@property   (nonatomic,strong)  UILabel     *timeLabel;
@property   (nonatomic,strong)  MediaView   *mediaView;
@property   (nonatomic,strong)  UILabel     *describeLabel;
@property   (nonatomic,strong)  UIButton    *commentButton;
@property   (nonatomic,strong)  UIButton    *praiseButton;
@property   (nonatomic,strong)  CommentGroupView    *commentGroupView;
@property   (nonatomic,strong)  PraiseBar   *praiseBar;



-(instancetype)init;

@end
