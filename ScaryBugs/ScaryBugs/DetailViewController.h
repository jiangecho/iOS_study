//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTRateView.h"
#import "ScaryBugDoc.h"

@interface DetailViewController : UIViewController<UITextFieldDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) ScaryBugDoc* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet RWTRateView *rateView;

@property (strong, nonatomic) UIImagePickerController* picker;

- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFiedlTextChanged:(id)sender;

@end

