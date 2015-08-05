//
//  CDTermsAndConditionsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDTermsAndConditionsViewController.h"

@interface CDTermsAndConditionsViewController ()

@end

@implementation CDTermsAndConditionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.navigationItem setHidesBackButton:YES];
        
        self.title = NSLocalizedString(@"Terms and Conditions", @"Terms and Conditions");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [rightButton setFrame:CGRectMake(0, 0, 40, 30)];
//        [rightButton setTitle:@"OK" forState:UIControlStateNormal];
//        [rightButton setBackgroundImage:[UIImage imageNamed:@"btn_Signup.png"] forState:UIControlStateNormal];
//        [rightButton addTarget:self action:@selector(okTapped:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//        
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Done" target:self action:@selector(okTapped:)];
        
    
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

- (void)okTapped:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
