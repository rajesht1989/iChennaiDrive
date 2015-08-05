//
//  CDEditProfileViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#define SECTION_HEADER_HEIGHT				20


#import "CDEditProfileViewController.h"
#import "CDTableCellWithInfo.h"

@interface CDEditProfileViewController ()

@end

@implementation CDEditProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Edit profile", @"Edit profile");
        //[self.navigationItem setTitleViewWithTitle:self.title];

//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Done" target:self action:@selector(doneTapped:)];
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


/**
 *      TableView data source
 **/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


/**
 *      TableView data source
 **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else if (section == 1){
        return 2;
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
        cell.textField.delegate = self;
        [cell.infoButton setHidden:YES];
	}
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [cell.textField setPlaceholder:@"E-Mail"];
                break;
            case 1:
                [cell.textField setPlaceholder:@"Mobile No."];
                break;
                
            default:
                break;
        }
        
    }
    else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                [cell.textField setPlaceholder:@"Password"];
                [cell.textField setSecureTextEntry:YES];
                cell.textField.tag = indexPath.row;
                break;
            case 1:
                [cell.textField setPlaceholder:@"Confirm Password"];
                [cell.textField setSecureTextEntry:YES];
                cell.textField.tag = indexPath.row;
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
    if (section == 0) {
        return @"Contact Information";
    }
    else if (section == 1){
        return @"Password";
    }
    return @"";
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

- (void)doneTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Profile has been edited successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%d",textField.tag);
    //if (textField == passwordField)
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         self.view.transform = CGAffineTransformMakeTranslation(0, 0);
     }];
    return YES;
}

@end
