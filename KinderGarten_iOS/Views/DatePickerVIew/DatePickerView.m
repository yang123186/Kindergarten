//
//  DatePickerView.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/27/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "DatePickerView.h"
#import "General.h"

static  const   CGFloat pickerViewHeight=180.0f;
static const    CGFloat toolBarHeight=30.0f;
static  NSString    *okButtonTitle=@"确定";
static  NSString    *cancelButtonTitle=@"取消";


@interface DatePickerView()

@property   (nonatomic,assign)  BOOL    isShowing;

@end


@implementation DatePickerView


-(instancetype)init{
    if(self=[super init]){
        [self createViews];
    }
    return self;
}

-(void)createViews{
    self.backgroundColor=CLEAR_COLOR;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelButtonTouched)];
    [self addGestureRecognizer:tapGesture];
    
    self.picker=[[UIDatePicker alloc]init];
    [self.picker setDatePickerMode:UIDatePickerModeDateAndTime];
    [self.picker setMinimumDate:[NSDate date]];
    //    [self.picker setDate:self.currentDate animated:YES];
    self.picker.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.picker];
    [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:pickerViewHeight]);
    }];
    
    
    self.toolBar=[[UIToolbar alloc]init];
    self.toolBar.userInteractionEnabled=YES;
    self.toolBar.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.toolBar];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.picker.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo([NSNumber numberWithDouble:toolBarHeight]);
    }];
    
    self.OKbutton=[[UIBarButtonItem alloc]initWithTitle:okButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(okButtonTouched)];
    self.cancelButton=[[UIBarButtonItem alloc]initWithTitle:cancelButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonTouched)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *items=[NSArray arrayWithObjects:self.cancelButton,flexItem,self.OKbutton, nil];
    [self.toolBar setItems:items];
    
    
    
}

-(void)setDate:(NSDate *)date{
    [self.picker setDate:date animated:YES];
}


-(void)okButtonTouched{
    if([self.delegate respondsToSelector:@selector(dateChoosedWithDate:)]){
        [self.delegate dateChoosedWithDate:self.picker.date];
    }
}

-(void)cancelButtonTouched{
    if([self.delegate respondsToSelector:@selector(cancelButtonTouched)]){
        [self.delegate cancelButtonTouched];
    }
}


//-(void)showOnView:(UIView *)view{
//    CGRect frame=[Screen bounds];
//    frame.origin.y=frame.origin.y+pickerViewHeight+toolBarHeight;
//    self.frame=frame;
//    
//}

+(CGFloat)height{
    return pickerViewHeight+toolBarHeight;
}

@end
