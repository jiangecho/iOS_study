//
//  DetailViewController.m
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "DetailViewController.h"
#import "RWTRateView.h"
#import "RWTUIImageExtras.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    /*
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
     */
    
    self.rateView.notSelectedImage = [UIImage imageNamed:@"shockedface2_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"shockedface2_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"shockedface2_full.png"];
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    if (self.detailItem) {
        self.titleField.text = self.detailItem.data.name;
        self.imageView.image = self.detailItem.fullImage;
        self.rateView.rating = self.detailItem.data.rating;
        
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPictureTapped:(id)sender {
    if (self.picker == nil) {
        self.picker = [[UIImagePickerController alloc]init];
        self.picker.delegate = self;
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.editing = false;
    }
    
    [self presentViewController:_picker animated:YES completion:nil];
    
}

- (IBAction)titleFiedlTextChanged:(id)sender {
    self.detailItem.data.name = self.titleField.text;
}

#pragma mark UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark RWTRateViewDelegate
- (void)rateView:(RWTRateView *)rateView ratingDidChange:(float)rating {
    self.detailItem.data.rating = rating;
    [self.rateView setRating:rating];
    
}

#pragma mark UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage* fullImage = (UIImage* )[info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage* thumbImage = [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44, 44)];
    
    self.detailItem.fullImage = fullImage;
    self.detailItem.thumbImage = thumbImage;
    
    self.imageView.image = fullImage;
}

@end
