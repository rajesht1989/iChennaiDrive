//
//  CDVehicleServiceHistoryViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/4/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDVehicleServiceHistoryViewController.h"
#import "CDServiceDetailsCell.h"

@interface CDVehicleServiceHistoryViewController ()

@end

@implementation CDVehicleServiceHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Service details", @"Service details");
        //[self.navigationItem setTitleViewWithTitle:self.title];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    requestedServicesArray = @[@"Oil change",@"Water service", @"General service"];
    stringArray = @[@"Raj yamaha, Thoraipakkam, Kanchipuram, Chennai - 600113",@"I need my bike within afternoon. Please let me know once service is done.",@"We are recommending you to change your bike's break oil since it going to be expired."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark TableView DataSourse
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
            case 1:
            return 1;
            break;
        case 2:
            return [requestedServicesArray count];
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        case 5:
            return 2;
            break;
            
        default:
            break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        CGSize sizeOfText = [[stringArray objectAtIndex:0] sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];

        return sizeOfText.height+40;
    }
    else if (indexPath.section == 3) {
        CGSize sizeOfText = [[stringArray objectAtIndex:1] sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
        
        return sizeOfText.height+40;
    }
    else if (indexPath.section == 4) {
        CGSize sizeOfText = [[stringArray objectAtIndex:2] sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
        
        return sizeOfText.height+40;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDServiceDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDServiceDetailsCell getServiceDetailsCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.textLabel setHidden:YES];
        [cell.detailLabel setHidden:YES];
        [cell.fullCellLabel setHidden:YES];
        [cell.textView setHidden:YES];
    }
    switch (indexPath.section) {
        case 0:{
            [cell.textLabel setHidden:NO];
            [cell.detailLabel setHidden:NO];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Serviced date:";
                    cell.detailLabel.text = @"12 Apr 2013";
                    break;
                case 1:
                    cell.textLabel.text = @"Serviced KM:";
                    cell.detailLabel.text = @"4500 km";
                    break;
                case 2:
                    cell.textLabel.text = @"Service type:";
                    cell.detailLabel.text = @"Paid";
                    break;
                case 3:
                    cell.textLabel.text = @"Service cost Rs:";
                    cell.detailLabel.text = @"2564";
                    break;
//                case 4:
//                    cell.textLabel.text = @"Dealer:";
//                    cell.detailLabel.text = @"Raj yamaha, Thoraipakkam, Chennai";
//                    [cell.detailLabel sizeToFit];
//                    break;
//                    
                default:
                    break;
            }
        }
            break;
        case 1:{
            [cell.textView setHidden:NO];
            
            //CGSize vSize = [@"gfuykbjh qwertyuiop tytyhhh zxcvbnm qwertyuio" sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14]];
            
            cell.textView.text = [stringArray objectAtIndex:0];
            CGSize sizeOfText = [cell.textView.text sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
            CGRect frame =  cell.textView.frame;
            cell.frame = CGRectMake(frame.origin.x,frame.origin.y, frame.size.width, sizeOfText.height);
            
        }
            break;
        case 2:{
        [cell.fullCellLabel setHidden:NO];
            cell.fullCellLabel.text = [requestedServicesArray objectAtIndex:indexPath.row];
        }
            break;
        case 3:{
            [cell.textView setHidden:NO];
            cell.textView.text = [stringArray objectAtIndex:1];
            CGSize sizeOfText = [cell.textView.text sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
            CGRect frame =  cell.textView.frame;
            cell.frame = CGRectMake(frame.origin.x,frame.origin.y, frame.size.width, sizeOfText.height);
        }
            break;
        case 4:{
            [cell.textView setHidden:NO];
            cell.textView.text = [stringArray objectAtIndex:2];
            CGSize sizeOfText = [cell.textView.text sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
            CGRect frame =  cell.textView.frame;
            cell.frame = CGRectMake(frame.origin.x,frame.origin.y, frame.size.width, sizeOfText.height);
        }
            break;
        case 5:{
            [cell.textLabel setHidden:NO];
            [cell.detailLabel setHidden:NO];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Next service date:";
                    cell.detailLabel.text = @"12 Aug 2013";
                    break;
                case 1:
                    cell.textLabel.text = @"Next service KM:";
                    cell.detailLabel.text = @"6000 km";
                    break;
                    
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    return cell;
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"General Info";
            break;
        case 1:
            return @"Dealer Info";
            break;
        case 2:
            return @"Requested services";
            break;
        case 3:
            return @"User comment";
            break;
        case 4:
            return @"Dealer comment";
            break;
        case 5:
            return @"Service recommendations";
            break;
            
        default:
            break;
    }
    return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
    //UIView *view = [UIView getTableViewSectionViewWithTitle:sectionTitle];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 00, 300, 20);
    label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
    label.font = fontWithSize(15);
    label.text = sectionTitle;
	
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view addSubview:label];
	
    return view;
}
@end
