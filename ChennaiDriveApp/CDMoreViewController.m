//
//  CDMoreViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMoreViewController.h"
#import "CDProfileViewController.h"
#import "CDHelpViewController.h"
#import "CDMessagesViewController.h"
#import "UINavigationController+CDNavigationController.h"

#import "CDAboutUsViewController.h"
#import "CDTroubleshootingViewController.h"
#import "CDWriteUsViewController.h"
#import "CDEmergencyViewController.h"

@interface CDMoreViewController ()

@end

@implementation CDMoreViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"More", @"More");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        self.tabBarItem.image = [UIImage imageNamed:@"tab4"];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Logout" target:self action:@selector(logoutTapped:)];
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

- (IBAction)profileBtnTapped:(id)sender {
    CDProfileViewController *profileVC = [[CDProfileViewController alloc]initWithNibName:@"CDProfileViewController" bundle:nil];
//    UINavigationController *navigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:profileVC];
    [self.navigationController pushViewController:profileVC animated:YES];
}

- (IBAction)helpBtnTapped:(id)sender {
    CDHelpViewController *helpVC = [[CDHelpViewController alloc]initWithNibName:@"CDHelpViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:helpVC];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (IBAction)messagesBtnTapped:(id)sender {
    CDMessagesViewController *messagesVC = [[CDMessagesViewController alloc]initWithNibName:@"CDMessagesViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:messagesVC];
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (IBAction)logoutTapped:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:nil];
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

- (IBAction)emergencyTapped:(id)sender {
    CDEmergencyViewController *emergencyVC = [[CDEmergencyViewController alloc]initWithNibName:@"CDEmergencyViewController" bundle:nil];
    [self.navigationController pushViewController:emergencyVC animated:YES];
}

- (IBAction)showRoomTapped:(id)sender {
}



@end
