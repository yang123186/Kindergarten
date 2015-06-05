//
//  DatePickerView.h
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewDelegate <NSObject>

-(void)dateChoosedWithDate:(NSDate*)date;
-(void)cancelButtonTouched;

@end


@interface DatePickerView : UIView

@property   (nonatomic,strong)  UIDatePicker    *picker;
@property   (nonatomic,strong)  UIToolbar       *toolBar;
@property   (nonatomic,strong)  UIBarButtonItem *OKbutton;
@property   (nonatomic,strong)  UIBarButtonItem *cancelButton;
@property   (nonatomic,weak)    id<DatePickerViewDelegate>delegate;


-(instancetype)init;

-(void)setDate:(NSDate*)date;

+(CGFloat)height;

//-(void)showOnView:(UIView*)view;
//
//-(void)dismiss;

@end
