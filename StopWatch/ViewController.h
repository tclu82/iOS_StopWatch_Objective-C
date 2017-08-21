//
//  ViewController.h
//  StopWatch
//
//  Created by Zac on 8/20/17.
//  Copyright © 2017 Zac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer* myTimer;
    
    BOOL running;
    
    int count;
}

@property (weak, nonatomic) IBOutlet UILabel *timerLable;

@property (weak, nonatomic) IBOutlet UIButton *restartButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)pushStart:(id)sender;

- (IBAction)pushReset:(id)sender;

- (void) updateTimer;

@end
