//
//  CDMessageDetailsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMessageDetailsViewController.h"

@interface CDMessageDetailsViewController ()

@end

@implementation CDMessageDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Message details", @"Message details");
        //[self.navigationItem setTitleViewWithTitle:self.title];
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStyleDone target:self action:@selector(deleteTapped:)];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Delete" target:self action:@selector(deleteTapped:)];
        
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

- (void)deleteTapped:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Message deleted successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{    [self.navigationController popViewControllerAnimated:YES];
}

@end
