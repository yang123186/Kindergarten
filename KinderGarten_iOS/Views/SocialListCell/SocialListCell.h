//
//  SocialListCell.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaView.h"
#import "PraiseLabel.h"
#import "commentGroupView.h"
#import "SocialListModal.h"

#import "PraiseLabel.h"

@class SocialListCell;
@protocol SocialLisrCellDelegate <NSObject>

-(void)praiseButtonDidTouchedInCell:(SocialListCell*)cell;
-(void)commentButtonDidTouchedInCell:(SocialListCell*)cell;

@end


static NSString *socialListCellIdentifier=@"SOCIAL_LIST_CELL";

@interface SocialListCell : UITableViewCell

@property   (nonatomic,strong)  UIImageView *icon;
@property   (nonatomic,strong)  UILabel     *nameLabel;
@property   (nonatomic,strong)  UILabel     *timeLabel;
@property   (nonatomic,strong)  MediaView   *mediaView;
@property   (nonatomic,strong)  RichLabel   *describeLabel;
@property   (nonatomic,strong)  UIButton    *commentButton;
@property   (nonatomic,strong)  UIButton    *praiseButton;
@property   (nonatomic,strong)  PraiseLabel   *praiseLabel;
@property   (nonatomic,strong)  CommentGroupView    *commentGroupView;

@property   (nonatomic,assign)  CGFloat     contentWidth;
@property   (nonatomic,weak)    SocialListModal *modal;

@property   (nonatomic,weak)    id<SocialLisrCellDelegate> delegate;

-(instancetype)init;

-(CGFloat)height;

-(void)setViewForModal:(SocialListModal*)modal;
@end
