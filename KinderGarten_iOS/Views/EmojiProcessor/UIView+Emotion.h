//
//  UIView+Emotion.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/23/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  The UIView category allows UIView's subview support Emotions.
 */
@interface UIView(Emotion)

/**
 *  When emotion should be used,use this method can transform  [XX] into matching emotion.
 *
 *  @param text the text which may contain emotion substring.
 */
-(void)setEmotionText:(NSString*)text;
@end
