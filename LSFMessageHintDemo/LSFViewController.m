//
//  LSFViewController.m
//  LSFMessageHintDemo
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 ShengfengLee. All rights reserved.
//

#import "LSFViewController.h"
#import "LSFMessageHint.h"

@interface LSFViewController ()

@end

@implementation LSFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)keyboardHide
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//改变时间
- (IBAction)timeChanged:(UIStepper *)sender {
    _timeLabel.text = [NSString stringWithFormat:@"%g秒", sender.value];
}
//改变yOffset
- (IBAction)yOffsetChanged:(UIStepper *)sender {
    _yOffSetTextFeild.text = [NSString stringWithFormat:@"%g", sender.value];
}

//显示
- (IBAction)show:(id)sender {
    [LSFMessageHint showHintViewWithActivity:_activitySegment.selectedSegmentIndex AndMessage:_textView.text yOffset:_yOffsetStepper.value];
}

//隐藏
- (IBAction)hide:(id)sender {
    [LSFMessageHint hideHintViewWithAnimate:YES];
}

//自动隐藏,默认2秒
- (IBAction)showTool:(id)sender {
    [LSFMessageHint showToolMessage:_textView.text yOffset:_yOffsetStepper.value];
}

//自动隐藏,根据制定时间
- (IBAction)showToolWithTime:(id)sender {
    [LSFMessageHint showToolMessage:_textView.text hideAfter:_timeStepper.value yOffset:_yOffsetStepper.value];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _yOffsetStepper.value = textField.text.doubleValue;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    _yOffsetStepper.value = textField.text.doubleValue;
    return YES;
}


@end
