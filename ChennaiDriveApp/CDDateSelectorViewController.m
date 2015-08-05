//
//  CDDateSelectorViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDDateSelectorViewController.h"

@interface CDDateSelectorViewController ()

@end

@implementation CDDateSelectorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
        [self.navigationItem setRightBarButtonItem:rightBarButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    datePicker.datePickerMode = UIDatePickerModeDate;
    NSDate *today = [NSDate date];
    [datePicker setMinimumDate:today];
    //[datePicker setMaximumDate:[self getToDate]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    datePicker = nil;
    [super viewDidUnload];
}

- (IBAction)datePickerValueChanged:(id)sender {
}

- (void)doneTapped:(id)sender{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd MMM yyyy"];
    NSString *dateString = [formatter stringFromDate:datePicker.date];
    [self.delegate datePickerViewDoneWithDateString:dateString];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
