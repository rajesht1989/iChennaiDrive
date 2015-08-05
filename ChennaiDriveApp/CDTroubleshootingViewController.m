//
//  CDTroubleshootingViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDTroubleshootingViewController.h"
#import "CDTrobuleshootingDatailViewController.h"

@interface CDTroubleshootingViewController ()

@end

@implementation CDTroubleshootingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Troubleshooting", @"Troubleshooting");
        //[self.navigationItem setTitleViewWithTitle:self.title];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    bikesArray = @[@"Starting problem", @"Battery problem",@"Oil change indication", @"Vibration",@"Punture"];
    carsArray = @[@"Starting problem", @"AC issues", @"Punture",@"Coolant change"];
    troubleshootingArray = bikesArray;
    [troubleshootingTableView reloadData];
    [self sementChanged:segmentControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [troubleshootingArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:UIColorFromRGB(0x9A9A9A)];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    cell.textLabel.text = [troubleshootingArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"List of TS";
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDTrobuleshootingDatailViewController *TrobuleshootingDatailVC = [[CDTrobuleshootingDatailViewController alloc]initWithNibName:@"CDTrobuleshootingDatailViewController" bundle:nil];
    [self.navigationController pushViewController:TrobuleshootingDatailVC animated:YES];
}

- (IBAction)sementChanged:(id)sender {
    UISegmentedControl *segmentedController = (UISegmentedControl*)sender;
            if(segmentedController.selectedSegmentIndex == 0)
            {
                troubleshootingArray = bikesArray;
                [segmentedController setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
                [segmentedController setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
                
                [segmentedController setBackgroundImage:[UIImage imageNamed:@"left_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
                [segmentedController setBackgroundImage:[UIImage imageNamed:@"right_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            }
            else if (segmentedController.selectedSegmentIndex == 1)
            {
                troubleshootingArray = carsArray;
                [segmentedController setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
                [segmentedController setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
                
                [segmentedController setBackgroundImage:[UIImage imageNamed:@"right_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
                [segmentedController setBackgroundImage:[UIImage imageNamed:@"left_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            }
            
            [troubleshootingTableView reloadData];
}

- (void)viewDidUnload {
    troubleshootingTableView = nil;
    segmentControl = nil;
    [super viewDidUnload];
}
@end
