//
//  ViewController.m
//  Tap Me
//
//  Created by jiangecho on 15/5/4.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    [self setUpGame];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed{
    NSLog(@"button pressed");
    count ++;
    scoreLable.text = [NSString stringWithFormat:@"score: \n%i", (int)count];
    
    [buttonBeep play];
}

- (void)setUpGame{
    count = 0;
    seconds = 30;
    
    timerLable.text = [NSString stringWithFormat:@"Time:%i", (int)seconds];
    scoreLable.text = [NSString stringWithFormat:@"score: \n%i", (int)count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                           target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil repeats:YES];
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setUpGame];
}

- (void)subtractTime{
    seconds --;
    timerLable.text = [NSString stringWithFormat:@"Time: %i", (int)seconds];
   
    [secondBeep play];
    
    if (seconds == 0) {
        [timer invalidate];
        
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"time out" message:@"time out message" delegate:self cancelButtonTitle:@"play again" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (AVAudioPlayer* ) setupAudioPlayerWithFile: (NSString*)file type: (NSString*)type{
    
    NSString* path = [[NSBundle mainBundle]pathForResource:file ofType:type];
    NSURL* url = [NSURL fileURLWithPath:path];
    
    NSError* error;
    
    AVAudioPlayer* avVudioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    return avVudioPlayer;
}

@end
