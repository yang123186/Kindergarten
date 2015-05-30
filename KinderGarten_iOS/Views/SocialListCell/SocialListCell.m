//
//  SocialListCell.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "SocialListCell.h"
#import "General.h"

static  const   CGFloat iconEdgeLength=50.0f;
static  const   CGFloat iconBorderWidth=0.5f;

static  const   CGFloat iconPaddingTop=10.0f;
static  const   CGFloat iconPaddingLeft=15.0f;


static const    CGFloat nameLabelMarginLeft=10.0f;
static const    CGFloat nameLabelHeight=13.5f;

static const    CGFloat timeLabelMarginTop=23.0f;

static const    CGFloat viewMarginTop=15.0f;
static const    CGFloat viewMarginHorizontal=15.0f;

static const    CGFloat describeViewMarginTop=15.0f;

static const    CGFloat functionButtonTop=10;
static const    CGFloat functionButtonMarginHorizontal=5.0f;
static const    CGFloat functionButtonWidth=50.0f;
static const    CGFloat functionButtonHeight=24.0f;
static const    CGFloat functionButtonBorderWidth=0.5f;

static const CGFloat    fontSize=13.0f;

static const    CGFloat commentGroupTop=10.0f;
@implementation SocialListCell

-(instancetype)init{
    if(self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:socialListCellIdentifier]){
        self.contentWidth=[Screen width]-2*viewMarginHorizontal;
        [self createBaseView];
    }
    return self;
}

-(void)createBaseView{
    self.icon=[[UIImageView alloc]init];
    [self.icon setCircleRadius:iconEdgeLength/2];
    [self.icon.layer setBorderColor:PINK_COLOR.CGColor];
    [self.icon.layer setBorderWidth:iconBorderWidth];
    self.icon.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(iconPaddingTop);
        make.left.equalTo(self.contentView.mas_left).with.offset(iconPaddingLeft);
        make.width.equalTo([NSNumber numberWithDouble:iconEdgeLength]);
        make.height.equalTo([NSNumber numberWithDouble:iconEdgeLength]);
    }];
    
    self.nameLabel=[[UILabel alloc]init];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).with.offset(nameLabelMarginLeft);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentView.mas_top).with.offset(iconPaddingTop);
        make.height.equalTo([NSNumber numberWithDouble:nameLabelHeight]);
    }];
    
    self.timeLabel=[[UILabel alloc]init];
    self.timeLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(timeLabelMarginTop);
        make.height.equalTo(self.nameLabel.mas_height);
    }];
    
}

-(void)destoryConstraints{
    if(self.commentGroupView){
        [self.commentGroupView mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.commentGroupView removeFromSuperview];
        self.commentGroupView=nil;
    }
    
    if(self.praiseLabel.superview){
        [self.praiseLabel mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.praiseLabel removeFromSuperview];
        self.praiseLabel=nil;
    }
    
    if(self.praiseButton.superview){
        [self.praiseButton mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.praiseButton removeFromSuperview];
        self.praiseButton=nil;
    }
    
    if(self.commentButton.superview){
        [self.commentButton mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.commentButton removeFromSuperview];
        self.commentButton=nil;
    }
    
    if(self.describeLabel.superview){
        [self.describeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.describeLabel removeFromSuperview];
        self.describeLabel=nil;
    }
    
    if(self.mediaView.superview){
        [self.mediaView mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        [self.mediaView removeFromSuperview];
        self.mediaView=nil;
    }
}

-(void)setViewForModal:(SocialListModal*)modal{
    self.modal=modal;
    [self destoryConstraints];
    
    [self.icon setImageWithURL:[NSURL URLWithString:modal.cUser.avatar]];
    [self.nameLabel setText:modal.cUser.appellation];
    [self.timeLabel setText:modal.timestamp.userEasyKnowTimeFormat];
    UIView *preView=self.timeLabel;
    
    if(modal.pictures && modal.pictures.count>0){
        self.mediaView=[[MediaView alloc]init];
        [self.mediaView setViewForArray:modal.pictures];
        [self.contentView addSubview:self.mediaView];
        self.mediaView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.mediaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preView.mas_bottom).with.offset(viewMarginTop);
            make.left.equalTo(self.contentView.mas_left).with.offset(viewMarginHorizontal);
            make.right.equalTo(self.contentView.mas_right).with.offset(-viewMarginHorizontal);
            make.height.equalTo([NSNumber numberWithDouble:self.mediaView.height]);
        }];
        preView=self.mediaView;
    }

    if(modal.content){
        self.describeLabel=[[UILabel alloc]init];
        self.describeLabel.translatesAutoresizingMaskIntoConstraints=NO;
        [self.describeLabel setText:modal.content];
        [self.describeLabel setFont:[UIFont systemFontOfSize:fontSize]];
        [self.describeLabel setNumberOfLines:0];
        [self.contentView addSubview:self.describeLabel];
        [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preView.mas_bottom).with.offset(viewMarginTop);
            make.left.equalTo(self.contentView.mas_left).with.offset(viewMarginHorizontal);
            make.right.equalTo(self.contentView.mas_right).with.offset(-viewMarginHorizontal);
            make.height.equalTo([NSNumber numberWithDouble:[self.describeLabel.text heightWithFontSize:fontSize andWidth:self.contentWidth]]);
//            make.height.equalTo(self.describeLabel.mas_height);
        }];
        preView=self.describeLabel;
    }
    

    self.commentButton=[[UIButton alloc]init];
    self.commentButton.layer.borderColor=BLACK_COLOR.CGColor;
    [self.commentButton setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    self.commentButton.layer.borderWidth=functionButtonBorderWidth;
    [self.commentButton setCircleRadius:functionButtonHeight/2];
    self.commentButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.commentButton];
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(preView.mas_bottom).with.offset(functionButtonTop);
        make.right.equalTo(self.contentView.mas_right).with.offset(-viewMarginHorizontal);
        make.width.equalTo([NSNumber numberWithDouble:functionButtonWidth]);
        make.height.equalTo([NSNumber numberWithDouble:functionButtonHeight]);
    }];
    preView=self.commentButton;
   
    
    self.praiseButton=[[UIButton alloc]init];
    self.praiseButton.layer.borderColor=BLACK_COLOR.CGColor;
    [self.praiseButton setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    self.praiseButton.layer.borderWidth=functionButtonBorderWidth;
    [self.praiseButton setCircleRadius:functionButtonHeight/2];
    self.praiseButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.contentView addSubview:self.praiseButton];
    [self.praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commentButton.mas_top);
        make.height.equalTo(self.commentButton.mas_height);
        make.width.equalTo(self.commentButton.mas_width);
        make.right.equalTo(self.commentButton.mas_left).with.offset(-functionButtonMarginHorizontal);
    }];
    preView=self.praiseButton;
    

    if(modal.cLikes.aLikes.count>0){
        self.praiseLabel=[[PraiseLabel alloc]initWithWidth:[Screen width]];
        [self.praiseLabel setViewForContainer:modal.cLikes];
        
        self.praiseLabel.translatesAutoresizingMaskIntoConstraints=NO;
//        [self.praiseLabel setText:@"http://zhangsihao.com  13856685566  ][不服][给跪][不服][不服][给跪][不服][不服][给跪] "];
//        [self.praiseLabel appendUserWithName:@"周瑞琦" UserLink:@"rdd7.com"];
//        [self.praiseLabel appendContent:@","];
//        [self.praiseLabel appendUserWithName:@"😄点我啊" UserLink:@"bacd111"];
//        [self.praiseLabel setBackgroundColor:BLACK_COLOR];
//        [self.praiseLabel setViewWithSocialLikesContainer:modal.cLikes];
        [self.contentView addSubview:self.praiseLabel];
        [self.praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preView.mas_bottom).with.offset(functionButtonTop);
            make.left.equalTo(self.contentView.mas_left).with.offset(viewMarginHorizontal);
            make.right.equalTo(self.contentView.mas_right).with.offset(-viewMarginHorizontal);
//            make.height.equalTo(self.praiseLabel.mas_height);
            make.height.equalTo(self.praiseLabel.mas_height);
        }];
        preView=self.praiseLabel;
    }
    
    if(modal.cComments.aComments.count>0){
        self.commentGroupView=[[CommentGroupView alloc]initWithCommentsContainer:modal.cComments width:self.contentWidth];
        self.commentGroupView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.contentView addSubview:self.commentGroupView];
        [self.commentGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preView.mas_bottom).with.offset(commentGroupTop);
            make.left.equalTo(self.contentView.mas_left).with.offset(viewMarginHorizontal);
            make.right.equalTo(self.contentView.mas_right).with.offset(-viewMarginHorizontal);
            make.bottom.equalTo(self.contentView.mas_bottom);
//            make.height.equalTo([NSNumber numberWithDouble:self.commentGroupView.height]);
        }];
    }
//    [self layoutIfNeeded];
    
}

-(instancetype)initWithSocialListModal:(SocialListModal*)modal{
    if(self=[self init]){
        [self setViewForModal:modal];
    }
    return self;
}

-(CGFloat)height{
    CGFloat height=iconEdgeLength+iconPaddingTop+viewMarginTop;
    if(self.mediaView&&self.mediaView.superview){
        height+=self.mediaView.height+viewMarginTop;
    }
    height+=[self.describeLabel.text heightWithFontSize:fontSize andWidth:self.contentWidth]+viewMarginTop*2+functionButtonHeight;
    if(self.modal.cLikes&&self.modal.cLikes.aLikes.count>0){
        CGFloat praise_height=[self.praiseLabel.attributedText boundingRectWithSize:CGSizeMake(self.contentWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
        DLog(@"谁谁谁觉得很赞 高度为:%f",praise_height);
        height+=praise_height+viewMarginTop;
    }
    if(self.modal.cComments&&self.modal.cComments.aComments.count>0){
        height+=viewMarginTop+self.commentGroupView.height;
    }
//    self.commentGroupView.height
    DLog(@"总高度:%f",height);
    return  height;
}

@end
