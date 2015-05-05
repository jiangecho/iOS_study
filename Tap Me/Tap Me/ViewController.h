//
//  ViewController.h
//  Tap Me
//
//  Created by jiangecho on 15/5/4.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel* scoreLable;
    IBOutlet UILabel* timerLable;
    
    NSInteger count;
    NSInteger seconds;
    
    NSTimer* timer;
    
    AVAudioPlayer* buttonBeep;
    AVAudioPlayer* secondBeep;
    AVAudioPlayer* backgroundMusic;
}


    -(IBAction)buttonPressed;
@end

