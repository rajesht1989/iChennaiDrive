//
//  CDWriteUsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDWriteUsViewController.h"

@interface CDWriteUsViewController ()

@end

@implementation CDWriteUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Write us", @"Write us");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(sendTapped:)];
        [self.navigationItem setRightBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Send" target:self action:@selector(sendTapped:)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)sendTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Your query has been logged successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{    [self.navigationController popViewControllerAnimated:YES];
}
@end
