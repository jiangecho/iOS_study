//
//  ViewController.h
//  QuoteGen
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong)NSArray* myQuotes;
@property (nonatomic, strong)NSMutableArray* moveQuotes;

@property (nonatomic, strong)IBOutlet UITextView* quoteText;

-(IBAction)quoteButtonTapped:(id)sender;

@end

