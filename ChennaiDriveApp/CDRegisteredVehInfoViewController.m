//
//  CDRegisteredVehInfoViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDRegisteredVehInfoViewController.h"
#import "CDVehicleServiceHistoryCell.h"
#import "CDVehicleServiceHistoryViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CDNewServiceViewController.h"
#import "UINavigationController+CDNavigationController.h"

#define ROW_HEIGHT          90.00
#define SECTION_HEADER_HEIGHT 25.00
#define FONT_HELVETICANEUE_BOLD @"HelveticaNeue-Bold"

@interface CDRegisteredVehInfoViewController ()

@end

@implementation CDRegisteredVehInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Vehicle details", @"Vehicle details");
        //[self.navigationItem setTitleViewWithTitle:self.title];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [vehicleServiceHistoryTable reloadData];
}


#pragma mark - UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == vehicleServiceHistoryTable)
    {
        static NSString *cellIdentifier = @"Cell";
        
        CDVehicleServiceHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [CDVehicleServiceHistoryCell getRegisteredVehicleCell];
        }
            
        return cell;
        
    }
    return nil;
}


-(CGFloat) tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return ROW_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //CDRegisteredVehInfo *selectedVehInfo = (CDRegisteredVehInfo*) [vehicles objectAtIndex:indexPath.section];
    
    CDVehicleServiceHistoryViewController *objVehicleInfoViewController = [[CDVehicleServiceHistoryViewController alloc]initWithNibName:@"CDVehicleServiceHistoryViewController" bundle:nil];
    //[objVehicleInfoViewController setSelectedVehicle:selectedVehInfo];
    [self.navigationController pushViewController:objVehicleInfoViewController animated:YES];
   // NSLog(@"Table Row Selected");
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SECTION_HEADER_HEIGHT;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Service History";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
   // UIView *view = [UIView getTableViewSectionViewWithTitle:sectionTitle];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 03, 300, 17);
    label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
    label.font = fontWithSize(15);
    label.text = sectionTitle;
	
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
    [view setBackgroundColor:[UIColor grayColor]];
    [view addSubview:label];
    return view;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)serviceMeTapped:(id)sender {
    
    CDNewServiceViewController *newServiceVC = [[CDNewServiceViewController alloc]initWithNibName:@"CDNewServiceViewController" bundle: nil];
    [newServiceVC loadCloseButton];
    UINavigationController *newServiceNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:newServiceVC];
    [self presentViewController:newServiceNavigationController animated:YES completion:nil];
}
@end
