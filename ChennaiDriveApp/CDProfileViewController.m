//
//  CDProfileViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//


#define SECTION_HEADER_HEIGHT				20

#import "CDProfileViewController.h"
#import "CDTableCellWithInfo.h"
#import "CDEditProfileViewController.h"


@interface CDProfileViewController ()

@end

@implementation CDProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"My profile", @"My profile");
        //[self.navigationItem setTitleViewWithTitle:self.title];

//        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
//        self.navigationItem.leftBarButtonItem = leftBarButton;
//        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(editTapped:)];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Edit" target:self action:@selector(editTapped:)];
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

- (void)editTapped:(id)sender{
    CDEditProfileViewController *editProfileVC = [[CDEditProfileViewController alloc]initWithNibName:@"CDEditProfileViewController" bundle:nil];
    [self.navigationController pushViewController:editProfileVC animated:YES];
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
    if (section == personalDetail) {
        return 2;
    }
    else if (section == accountDetail){
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
        [cell.infoButton setHidden:YES];
        [cell.textField setUserInteractionEnabled:NO];
	}
    if (indexPath.section == personalDetail) {
        switch (indexPath.row) {
            case 0:
                [cell.textField setText:@"Name"];
                break;
            case 1:
                [cell.textField setText:@"Username"];
                break;
            
            default:
                break;
        }
        
    }
    else if(indexPath.section == accountDetail){
        switch (indexPath.row) {
            case 0:
                [cell.textField setText:@"myEmail@123.com"];
                break;
            case 1:
                [cell.textField setText:@"8765765345"];
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
        return @"Personal Information";
    }
    else if (section == accountDetail){
        return @"Contact Information";
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




@end
