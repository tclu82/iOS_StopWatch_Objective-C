//
//  ViewController.m
//  StopWatch
//
//  Created by Zac on 8/20/17.
//  Copyright © 2017 Zac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timerLable, startButton, restartButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    running = NO;
    
    count = 0;
    
    timerLable.text = @"00:00.00";
    
    startButton.layer.cornerRadius = 45;

    restartButton.layer.cornerRadius = 45;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushStart:(id)sender
{
    if (running == NO)
    {
        running = YES;
        
        [startButton setTitle:@"STOP" forState:UIControlStateNormal];
        
        if (myTimer == nil)
        {
            myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        }
    }
    else
    {
        [self stopTimer];
    }
}

- (void) stopTimer
{
    running = NO;
    
    [myTimer invalidate];
    
    myTimer = nil;
    
    [startButton setTitle:@"START" forState:UIControlStateNormal];
}

- (IBAction)pushReset:(id)sender
{
    [self stopTimer];
    
    count = 0;
    
    timerLable.text = @"00:00.00";
}

- (void) updateTimer
{
    count++;
    
    int sec = floor(count / 100);
    
    int min = floor(sec / 60);
    
    int mSec = count % 100;
    
    if (sec >= 60)
    {
        sec %= 60;
    }
    timerLable.text = [NSString stringWithFormat:@"%02d:%02d.%02d", min, sec, mSec];
}

@end
