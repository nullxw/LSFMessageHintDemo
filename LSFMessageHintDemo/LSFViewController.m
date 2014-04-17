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
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 300);
    
    _scrollView.scrollEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    
    [_scrollView addGestureRecognizer:tap];
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
- (IBAction)activityShowChanged:(UISegmentedControl *)sender {
}

//显示
- (IBAction)show:(id)sender {
    [LSFMessageHint showHintViewWithActivity:_activitySegment.selectedSegmentIndex AndMessage:_textView.text];
}

//隐藏
- (IBAction)hide:(id)sender {
    [LSFMessageHint hideHintViewWithAnimate:YES];
}

//自动隐藏,默认2秒
- (IBAction)showTool:(id)sender {
    [LSFMessageHint showToolMessage:_textView.text];
}

//自动隐藏,根据制定时间
- (IBAction)showToolWithTime:(id)sender {
    [LSFMessageHint showToolMessage:_textView.text hideAfter:_timeStepper.value];
}
@end
