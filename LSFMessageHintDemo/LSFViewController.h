//
//  LSFViewController.h
//  LSFMessageHintDemo
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 ShengfengLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSFViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activitySegment;//是否显示风火轮

@property (weak, nonatomic) IBOutlet UITextView *textView;  //文字内容
- (IBAction)timeChanged:(id)sender;//改变显示时间
- (IBAction)yOffsetChanged:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UIStepper *timeStepper; //改变时间
@property (weak, nonatomic) IBOutlet UIStepper *yOffsetStepper; //改变yOffset



@property (weak, nonatomic) IBOutlet UITextField *yOffSetTextFeild;//显示yOffset
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;    //显示时间
- (IBAction)show:(id)sender;
- (IBAction)hide:(id)sender;
- (IBAction)showTool:(id)sender;
- (IBAction)showToolWithTime:(id)sender;
@end
