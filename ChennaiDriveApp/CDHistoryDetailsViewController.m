//
//  CDHistoryDetailsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDHistoryDetailsViewController.h"

@interface CDHistoryDetailsViewController ()

@end

@implementation CDHistoryDetailsViewController
@synthesize txnDict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"History item details", @"History item details");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [tnxDateLbl setText:[txnDict objectForKey:@"date"]];
    [txnTypeLbl setText:[txnDict objectForKey:@"txnType"]];
    [txnAmountLbl setText:[txnDict objectForKey:@"amount"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    tnxDateLbl = nil;
    txnTypeLbl = nil;
    txnAmountLbl = nil;
    tnnDetailsLbl = nil;
    self.txnDict = nil;
    [super viewDidUnload];
}
@end
