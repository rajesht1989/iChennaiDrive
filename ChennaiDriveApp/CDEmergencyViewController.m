//
//  CDEmergencyViewController.m
//  ChennaiDriveApp
//
//  Created by Rajesh on 6/4/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDEmergencyViewController.h"

@interface CDEmergencyViewController ()

@end

@implementation CDEmergencyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    carsArray = @[@"BMW X6", @"BMW X1", @"Others"];
    bikesArray = @[@"Yemaha FZ-S", @"Honda unicorn", @"TVS Apache", @"Others"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [carsArray count];
    }
    else if (section == 1) {
        return [bikesArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:UIColorFromRGB(0x9A9A9A)];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [carsArray objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1){
        cell.textLabel.text = [bikesArray objectAtIndex:indexPath.row];
    }
   
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Cars";
    }
    else {
        return @"Bikes";
    }
    return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
    UIView *view = [UIView getTableViewSectionViewWithTitle:sectionTitle];

    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CDTrobuleshootingDatailViewController *TrobuleshootingDatailVC = [[CDTrobuleshootingDatailViewController alloc]initWithNibName:@"CDTrobuleshootingDatailViewController" bundle:nil];
//    [self.navigationController pushViewController:TrobuleshootingDatailVC animated:YES];
}


@end
