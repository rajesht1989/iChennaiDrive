//
//  CDHelpViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDHelpViewController.h"
#import "CDAboutUsViewController.h"
#import "CDTroubleshootingViewController.h"
#import "CDWriteUsViewController.h"

@interface CDHelpViewController ()

@end

@implementation CDHelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Help", @"Help");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
        self.navigationItem.leftBarButtonItem = leftBarButton;
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

- (void)doneTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)aboutUsButtonTapped:(id)sender {
    CDAboutUsViewController *aboutUsVC = [[CDAboutUsViewController alloc]initWithNibName:@"CDAboutUsViewController" bundle:nil];
    [self.navigationController pushViewController:aboutUsVC animated:YES];
}

- (IBAction)basicTroubleshootingButtonTapped:(id)sender {
    CDTroubleshootingViewController *troubleshootingVC = [[CDTroubleshootingViewController alloc]initWithNibName:@"CDTroubleshootingViewController" bundle:nil];
    [self.navigationController pushViewController:troubleshootingVC animated:YES];
}

- (IBAction)writeUsButtonTapped:(id)sender {
    CDWriteUsViewController *writeUsVC = [[CDWriteUsViewController alloc]initWithNibName:@"CDWriteUsViewController" bundle:nil];
    [self.navigationController pushViewController:writeUsVC animated:YES];
}
@end
