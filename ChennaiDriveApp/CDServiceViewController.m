//
//  CDSecondViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDServiceViewController.h"
#import "CDNewServiceViewController.h"
#import "CDServiceCell.h"
#import "CDServiceDetailsViewController.h"

@interface CDServiceViewController ()

@end

@implementation CDServiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Services", @"Sevices");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
//        UIBarButtonItem *rightBarbutton = [[UIBarButtonItem alloc]initWithTitle:@"New" style:UIBarButtonItemStyleDone target:self action:@selector(newTapped:)];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"New" target:self action:@selector(newTapped:)];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self segmentedControllerValueChanged:servicesSegment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)newTapped:(id)sender{
    CDNewServiceViewController *newServiceVC = [[CDNewServiceViewController alloc]initWithNibName:@"CDNewServiceViewController" bundle:nil];
    [newServiceVC setIsPushed:YES];
    [self.navigationController pushViewController:newServiceVC animated:YES];
}

- (IBAction)segmentedControllerValueChanged:(id)sender {
        if(servicesSegment.selectedSegmentIndex == 0)
        {
           // [self setVehicles:bikes];
            [servicesSegment setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            [servicesSegment setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            
            [servicesSegment setBackgroundImage:[UIImage imageNamed:@"left_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            [servicesSegment setBackgroundImage:[UIImage imageNamed:@"right_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        }
        else if (servicesSegment.selectedSegmentIndex == 1)
        {
            //[self setVehicles:cars];
            
            [servicesSegment setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            [servicesSegment setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            
            [servicesSegment setBackgroundImage:[UIImage imageNamed:@"right_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            [servicesSegment setBackgroundImage:[UIImage imageNamed:@"left_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        }
        
        [serviceTable reloadData];

}

- (void)viewDidUnload {
    servicesSegment = nil;
    serviceTable = nil;
    [super viewDidUnload];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (servicesSegment.selectedSegmentIndex) {
        return 3;
    }
    else{
        return 4;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


/**
 *      TableView data source
 **/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (servicesSegment.selectedSegmentIndex) {
        return @"History";
    }
    else{
        return @"Active services";
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDServiceCell getServiceCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    switch (indexPath.section) {
//        case 0:
//            cell.textLabel.text = [textArray objectAtIndex:indexPath.section];
//            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//            break;
//        case 1:
//            [cell.stateField setHidden:NO];
//            [cell.districtField setHidden:NO];
//            [cell.thirdField setHidden:NO];
//            [cell.numberField setHidden:NO];
//            
//            
//            break;
//        case 2:
//            [cell.textField setHidden:NO];
//            cell.textField.placeholder = [textArray objectAtIndex:indexPath.section];
//            break;
//        case 3:
//            cell.textLabel.text = [textArray objectAtIndex:indexPath.section];
//            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//            break;
//        default:
//            break;
//    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDServiceDetailsViewController *serviceDetailsVC = [[CDServiceDetailsViewController alloc]initWithNibName:@"CDServiceDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:serviceDetailsVC animated:YES];
}

@end
