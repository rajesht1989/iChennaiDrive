//
//  CDLoginViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDLoginViewController.h"
#import "CDRegistrationViewController.h"
#import "UINavigationController+CDNavigationController.h"


#define SECTIONS_LOGIN 2
#define ROWS_LOGIN_SECTION_0 2
#define ROWS_LOGIN_SECTION_1 1
#define TEXTFIELD_TAG 1

#define HEIGHT_DEMO_VIEW_WITH_MAINTENANCE 161
#define HEIGHT_DEMO_VIEW_WITHOUT_MAINTENANCE 231

/* Font */
#define FONT_SIZE_LABEL 14
#define FONT_SIZE_TEXT_FIELD 14
#define FONT_SIZE_DEMO_LABEL 13



@interface CDLoginViewController ()

@end

@implementation CDLoginViewController
@synthesize userNameCell;
@synthesize passwordCell;
@synthesize rememberMeCell;

@synthesize userNameField;
@synthesize passwordField;
@synthesize rememberMeSwitch;
@synthesize loginTable;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [rightButton setFrame:CGRectMake(0, 0, 55, 30)];
//        [rightButton.titleLabel setFont:fontWithSize(15)];
//        [rightButton setTitle:@"Login" forState:UIControlStateNormal];
//        [rightButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
//        [rightButton addTarget:self action:@selector(signInTapped:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Login" target:self action:@selector(signInTapped:)];
        
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 230, 40)];
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [imageview setImage:[UIImage imageNamed:@"Welcome"]];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 8, 150, 22)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:@"Chennai Drive"];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:fontWithSize(17)];
        
        [titleView addSubview:imageview];
        [titleView addSubview:label];
        
        [self.navigationItem setTitleView:titleView];
        
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
- (IBAction)newUserButtonTapped:(id)sender{
    CDRegistrationViewController *registrationViewController = [[CDRegistrationViewController alloc]initWithNibName:@"CDRegistrationViewController" bundle:nil];
    UINavigationController *registrationNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:registrationViewController];
    [self presentViewController:registrationNavigationController animated:YES completion:nil];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == passwordField)
        [UIView animateWithDuration:0.3 animations:^(void)
         {
             self.view.transform = CGAffineTransformMakeTranslation(0, -50);
         }];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField == passwordField)
        [UIView animateWithDuration:0.3 animations:^(void)
         {
             self.view.transform = CGAffineTransformMakeTranslation(0, 0);
         }];
    
    return YES;
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/**************************************************************************************************/
#pragma mark - UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.loginTable)
    {
        return SECTIONS_LOGIN;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.loginTable && section == 0)
    {
        return ROWS_LOGIN_SECTION_0;
    }
    else if (tableView == self.loginTable && section == 1)
    {
        return ROWS_LOGIN_SECTION_1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.loginTable)
    {
        return [self tableView:tableView loginCellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView loginCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return self.userNameCell;
    }
    else if (indexPath.section == 0 && indexPath.row == 1)
    {
        return self.passwordCell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0)
    {
        return self.rememberMeCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIView *view = [cell viewWithTag:TEXTFIELD_TAG];
    [view becomeFirstResponder];
}


/**************************************************************************************************/


- (void)signInTapped:(id)sender
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
