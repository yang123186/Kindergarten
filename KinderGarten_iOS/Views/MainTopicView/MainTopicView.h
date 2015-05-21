//
//  MainTopicView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/20/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTopicView : UIButton


@property   (nonatomic,strong)  UILabel     *topicLabel;
@property   (nonatomic,strong)  UILabel     *detailLabel;
@property   (nonatomic,strong)  UIImageView *accessoryImage;

/**
 *  Base initialize
 *
 *  @return A initialized MainTopicView instance.
 */
-(instancetype)init;


/**
 *  Initialize a MainTopicView instance and use setTopic:detail: method to set the information
 *
 *  @param topic  the topic string
 *  @param detail the detail of topic
 *
 *  @return A initialized MainTopicView instance.
 */
-(instancetype)initWithTopic:(NSString*)topic detail:(NSString*)detail;


/**
 *  Set the topic and detail
 *
 *  @param topic  the topic string
 *  @param detail the detail of topic
 */
-(void)setTopic:(NSString*)topic detail:(NSString*)detail;


/**
 *  Will automaic calculate the best height for this view.
 */
+(CGFloat)height;
@end
