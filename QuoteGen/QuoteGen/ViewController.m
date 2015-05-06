//
//  ViewController.m
//  QuoteGen
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    
    self.myQuotes = [NSMutableArray arrayWithContentsOfFile:plistPath];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)quoteButtonTapped:(id)sender {
    int random = arc4random() % [self.myQuotes count];
    NSString* quote = self.myQuotes[random][@"quote"];
    
    self.quoteText.text = quote;
}

@end
