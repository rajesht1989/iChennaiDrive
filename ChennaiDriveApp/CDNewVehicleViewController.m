//
//  CDNewVehicleViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDNewVehicleViewController.h"
#import "CDNewVehicleCell.h"
#import "CDBrandAndModelViewController.h"
#import "CDDealerSelectionViewController.h"
#import "UINavigationController+CDNavigationController.h"

@interface CDNewVehicleViewController ()

@end

@implementation CDNewVehicleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"New vehicle", @"New vehicle");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Register" style:UIBarButtonItemStyleDone target:self action:@selector(registerTapped:)];
        [self.navigationItem setRightBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Register" target:self action:@selector(registerTapped:)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    textArray = [[NSArray alloc]initWithObjects:@"Tap here to select your vehicle",@"",@"Enter vehicle owner name", @"Tap here to select dealer", nil];
    sectionTitleArray = @[@"Vehicle selection", @"Registration number", @"Owner Info",@"Preferred Dealer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
    UIView *view = [UIView getTableViewSectionViewWithTitle:sectionTitle];
    if (section == 3) {
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];infoButton.frame = CGRectMake(280, 12, 20, 20);
        [view addSubview:infoButton];
        [infoButton addTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
	
    return view;
}
/**
 *      TableView data source
 **/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sectionTitleArray objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDNewVehicleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDNewVehicleCell getNewVehicleCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.stateField setDelegate:self];
        [cell.districtField setDelegate:self];
        [cell.thirdField setDelegate:self];
        [cell.numberField setDelegate:self];
    }
    switch (indexPath.section) {
        case 0:
            [cell.cellTextLabel setHidden:NO];
            cell.cellTextLabel.text = [textArray objectAtIndex:indexPath.section];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        case 1:
            [cell.stateField setHidden:NO];
            [cell.districtField setHidden:NO];
            [cell.thirdField setHidden:NO];
            [cell.numberField setHidden:NO];
            
            
            break;
        case 2:
            [cell.textField setHidden:NO];
            cell.textField.placeholder = [textArray objectAtIndex:indexPath.section];
            break;
        case 3:
            [cell.cellTextLabel setHidden:NO];
            cell.cellTextLabel.text = [textArray objectAtIndex:indexPath.section];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CDBrandAndModelViewController *brandModelVC = [[CDBrandAndModelViewController alloc]initWithNibName:@"CDBrandAndModelViewController" bundle:nil];
        UINavigationController *navigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:brandModelVC];
        [self presentViewController:navigationController animated:YES completion:nil];
    }
    else if(indexPath.section == 3){
        CDDealerSelectionViewController *dealerSelectionVC = [[CDDealerSelectionViewController alloc]initWithNibName:@"CDDealerSelectionViewController" bundle:nil];
        [dealerSelectionVC addBarButton];
        UINavigationController *dealerSelectionNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:dealerSelectionVC];
        [self presentViewController:dealerSelectionNavigationController animated:YES completion:nil];
    }
}

- (void)registerTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Register tapped" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)infoButtonTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Info button tapped" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    switch (textField.tag) {
        case stateField:
            if (textField.text.length == 2) {
                [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            break;
        case districtField:
            if (textField.text.length == 2) {
                [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            break;
        case thirdField:
            if (textField.text.length >= 1) {
                [textField setText:[textField.text uppercaseString]];
                [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            break;
        case fourthField:{
            if (textField.text.length <1) {
                return NO;
            }
            int check = 4 - textField.text.length;
            for (int i = 1; i <= check; i++) {
                [textField setText:[@"0" stringByAppendingString:textField.text]];
            }
            [textField resignFirstResponder];
                return YES;
            break;
        }
        default:
            break;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    switch (textField.tag) {
        case stateField:{
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"zxcvbnmasdfghjklqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM"];
            for (int strCount = 0; strCount < [string length]; strCount++) {
                unichar c = [string characterAtIndex:strCount];
                if (![myCharSet characterIsMember:c]) {
                    return NO;
                }
            }
            if (textField.text.length == 1) {
                if (textField.text.length > range.location) {
                    return YES;
                }
                [textField setText:[[textField.text stringByAppendingString:string] uppercaseString]];
           [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            else if (textField.text.length>=2){
                if (textField.text.length > range.location) {
                    return YES;
                }
                return NO;
            }
            else
                return YES;
            break;
        }
        case districtField:{
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            for (int strCount = 0; strCount < [string length]; strCount++) {
                unichar c = [string characterAtIndex:strCount];
                if (![myCharSet characterIsMember:c]) {
                    return NO;
                }
            }
            
            if (textField.text.length == 1) {
                if (textField.text.length > range.location) {
                    return YES;
                }
                [textField setText:[textField.text stringByAppendingString:string]];
                [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            else if (textField.text.length>=2){
                if (textField.text.length > range.location) {
                    return YES;
                }
                return NO;
            }
            else
                return YES;
            break;
        }
        case thirdField:{
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"zxcvbnmasdfghjklqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM"];
            for (int strCount = 0; strCount < [string length]; strCount++) {
                unichar c = [string characterAtIndex:strCount];
                if (![myCharSet characterIsMember:c]) {
                    return NO;
                }
            }
            if (textField.text.length == 1) {
                if (textField.text.length > range.location) {
                    return YES;
                }
                [textField setText:[[textField.text stringByAppendingString:string] uppercaseString]];
                [[textField.superview viewWithTag:textField.tag+1] becomeFirstResponder];
                return NO;
            }
            else if (textField.text.length>=2){
                if (textField.text.length > range.location) {
                    return YES;
                }
                return NO;
            }
            else
                return YES;
            break;
            }
        case fourthField:{
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            for (int strCount = 0; strCount < [string length]; strCount++) {
                unichar c = [string characterAtIndex:strCount];
                if (![myCharSet characterIsMember:c]) {
                    return NO;
                }
                
            }
            if (textField.text.length == 3) {
                if (textField.text.length > range.location) {
                    return YES;
                }
                [textField setText:[textField.text stringByAppendingString:string]];
                [textField resignFirstResponder];
                return NO;
            }
            else if (textField.text.length>=4){
                if (textField.text.length > range.location) {
                    return YES;
                }
                return NO;
            }
            else
                return YES;
            break;
        }
            
        default:
            break;
    }
    return YES;
}

@end
