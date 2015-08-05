//
//  CDRegistrationViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//



#import "CDRegistrationViewController.h"

#import "CDTableCellWithInfo.h"

#import "CDTermsAndConditionsViewController.h"

#import "CDStretchableButton.h"

#define SECTION_HEADER_HEIGHT				20

@interface CDRegistrationViewController ()

@end

@implementation CDRegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = NSLocalizedString(@"Registration", @"Registration");
        //[self.navigationItem setTitleViewWithTitle:self.title];
    
//        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [leftButton setFrame:CGRectMake(0, 0, 55, 30)];
//        [leftButton.titleLabel setFont:fontWithSize(15)];
//        [leftButton setTitle:@"Cancel" forState:UIControlStateNormal];
//        [leftButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
//        [leftButton addTarget:self action:@selector(closeTapped:) forControlEvents:UIControlEventTouchUpInside];
        
//        UIBarButtonItem *leftBarButton =         
//        UIBarButtonItem *leftBarbutton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(closeTapped:)];
//        [leftBarbutton setTitle:@"Cancel"];
        self.navigationItem.leftBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Cancel" target:self action:@selector(closeTapped:)];
        
//        
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [rightButton setFrame:CGRectMake(0, 0, 55, 30)];
//        [rightButton.titleLabel setFont:fontWithSize(15)];
//        [rightButton setTitle:@"Sign up" forState:UIControlStateNormal];
//        [rightButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
//        [rightButton addTarget:self action:@selector(closeTapped:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//        UIBarButtonItem *rightBarbutton = [[UIBarButtonItem alloc]initWithTitle:@"Sign up" style:UIBarButtonItemStyleDone target:self action:@selector(closeTapped:)];
//        [rightBarbutton setTitle:@"Sign up"];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Sign up" target:self action:@selector(closeTapped:)];
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
    // Dispose of any resources that can be recreated.
}

#pragma Mark Tableview

/**
 *      TableView data source
 **/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
    UIView *view = [UIView getTableViewSectionViewWithTitle:sectionTitle];
    //    if (section == 3) {
    //        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];infoButton.frame = CGRectMake(280, 12, 20, 20);
    //        [view addSubview:infoButton];
    //        [infoButton addTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    //    }
	
    return view;
}


/**
 *      TableView data source
 **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == personalDetail) {
        return 2;
    }
    else if (section == accountDetail){
        return 3;
    }
    return NO;
}



/**
 *      TableView data source
 **/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CDTableCellWithInfo";
	CDTableCellWithInfo *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
	if (cell == nil)
	{
        cell = [CDTableCellWithInfo cellWithInfo];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.textField setDelegate:self];
	}
    [cell.infoButton removeTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.section == personalDetail) {
        switch (indexPath.row) {
            case 0:
                [cell.textField setPlaceholder:@"Enter your name"];
                [cell.textField setTag:userName];
                [cell.infoButton setHidden:YES];
                break;
            case 2:
                [cell.textField setPlaceholder:@"Enter your email"];
                [cell.textField setTag:eMail];
                [cell.infoButton setHidden:NO];
                [cell.infoButton setTag:eMail];
                [cell.infoButton addTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                [cell.textField setPlaceholder:@"Enter your mobile number"];
                [cell.textField setTag:mobileNo];
                [cell.infoButton setTag:mobileNo];
                [cell.infoButton setHidden:NO];
                [cell.infoButton addTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                break;
        }
        
    }
    else if(indexPath.section == accountDetail){
        switch (indexPath.row) {
            case 0:
                [cell.textField setPlaceholder:@"Enter your Email ID"];
                [cell.textField setTag:eMail];
                [cell.infoButton setTag:eMail];
                [cell.infoButton setHidden:NO];
                [cell.infoButton addTarget:self action:@selector(infoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                [cell.textField setPlaceholder:@"Enter your login password"];
                [cell.textField setTag:password];
                [cell.textField setSecureTextEntry:YES];
                [cell.infoButton setHidden:YES];
                break;
            case 2:
                [cell.textField setPlaceholder:@"Re-enter your login password"];
                [cell.textField setTag:confirmPassword];
                [cell.textField setSecureTextEntry:YES];
                [cell.infoButton setHidden:YES];
                break;
            default:
                break;
        }
        
    }
    return cell;
}

/**
 *      TableView data source
 **/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == personalDetail) {
        return @"Personal Details";
    }
    else if (section == accountDetail){
        return @"Account Details";
    }
    return @"";
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
//    NSLog(@"%d",textField.tag);
//    [registrationTableView setContentOffset:CGPointMake(0, 50*textField.tag) animated:YES];
////        [UIView animateWithDuration:0.3 animations:^(void)
////              {
////                 self.view.transform = CGAffineTransformMakeTranslation(0, -50);
//              }];
    switch (textField.tag) {
        case userName:
            [registrationTableView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case mobileNo:
            [registrationTableView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case eMail:
            [registrationTableView setContentOffset:CGPointMake(0, 40) animated:YES];
            break;
        case password:
            [registrationTableView setContentOffset:CGPointMake(0, 80) animated:YES];
            break;
        case confirmPassword:
            [registrationTableView setContentOffset:CGPointMake(0, 120) animated:YES];
            break;
        default:
            break;
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if (textField.tag == confirmPassword)
        [registrationTableView setContentOffset:CGPointMake(0, 0) animated:YES];

    return YES;
}


- (void)registrationCellWithInfo:(CDTableCellWithInfo *)cell textFieldValueChanged:(UITextField *)textField
{
    NSLog(@"%d",textField.tag);
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    NSInteger nextTag = 0;
    NSIndexPath *indexPath =nil;
    switch (textField.tag) {
        case userName:
            nextTag = mobileNo;
            indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            break;
            
        case mobileNo:
            nextTag = eMail;
            indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
            break;
            
        case eMail:
            nextTag = password;
            indexPath = [NSIndexPath indexPathForItem:1 inSection:1];
            break;
            
        case password:
            nextTag = confirmPassword;
            indexPath = [NSIndexPath indexPathForItem:2 inSection:1];
            break;
            
        case confirmPassword:
            [textField resignFirstResponder];
            break;
            
        default:
            break;
    }
    UITableViewCell *cell = [registrationTableView cellForRowAtIndexPath:indexPath];
    UIResponder* nextResponder = [cell viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}


- (void)closeTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)infoButtonTapped:(id)sender{
    NSString *message;
    
    switch ([sender tag]) {
        case eMail:
            message = @"Email info tapped";
            break;
        case mobileNo:
            message = @"Mobile info tapped";
            break;
        case loginName:
            message = @"Username info tapped";
            break;
        default:
            break;
    }
    
UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Information" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
[alert show];

}
- (IBAction)termsAndConditionButtonTapped:(id)sender {
    UIButton *button = (UIButton*)sender;
    if (button.currentImage == nil) {
        [button setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateNormal];
    }
    else{
        [button setImage:nil forState:UIControlStateNormal];
    }

}

- (IBAction)readTermsAndCondition:(id)sender {
    CDTermsAndConditionsViewController *termsAndConditionsViewController = [[CDTermsAndConditionsViewController alloc]initWithNibName:@"CDTermsAndConditionsViewController" bundle:nil];
    [self.navigationController pushViewController:termsAndConditionsViewController animated:YES];
}
@end
