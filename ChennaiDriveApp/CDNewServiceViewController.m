//
//  CDNewServiceViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDNewServiceViewController.h"
#import "CDNewServiceCell.h"
#import "CDDealerSelectionViewController.h"

@interface CDNewServiceViewController ()

@end

@implementation CDNewServiceViewController
@synthesize isPushed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"New service", @"New service");
        //[self.navigationItem setTitleViewWithTitle:self.title];

//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
        [self.navigationItem setRightBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Done" target:self action:@selector(doneTapped:)]];
        
    }
    return self;
}

- (void) loadCloseButton{
//    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(closeTapped:)];
    [[self navigationItem] setLeftBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Cancel" target:self action:@selector(closeTapped:)]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //textArray = @[@"Free service?", @"Select dealer", @"Date of service",@"Required services", @"Consultation required?", @"Comments"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            if (isExpandedView) {
                return [serviceListArray count] + 1;
            }
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            if (isExpandedPickUpCell) {
                return 3;
            }
            return 1;
            break;
        case 5:
            if (isExpandedDropCell) {
                return 2;
            }
            return 1;
            break;
        default:
            break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((indexPath.section == 1 && indexPath.row == 1) || indexPath.section == 3 ||(indexPath.section == 4 && indexPath.row == 2)||(indexPath.section == 5 && indexPath.row == 1)) {
        return 76;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return serviceTypeCell;
            break;
        case 1:
            if (indexPath.row == 0)
                return cell;
            else
                return serviceAvailabilityCell;
            break;

        case 2:
            countLabel.text = [NSString stringWithFormat:@"%d",[serviceListArray count]];
            if (isExpandedView) {
                if (indexPath.row == 0) {
                    [arrowImage setImage:[UIImage imageNamed:@"arrow_down"]];
                    return requiredServiceCell;
                }
                static NSString *cellIdentifier = @"Cell";
                UITableViewCell *expandedCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                for (UIView *view in [expandedCell subviews]) {
                    if ([view isKindOfClass:[UILabel class]]) {
                        [view removeFromSuperview];
                    }
                }
                if (expandedCell == nil) {
                    expandedCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                    [expandedCell setBackgroundColor:[UIColor lightGrayColor]];
                    [expandedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
                }
                UILabel *labelTxt = [[UILabel alloc]initWithFrame:CGRectMake(45, 11, 180, 21)];
                [labelTxt setBackgroundColor:[UIColor clearColor]];
                [labelTxt setTextColor:UIColorFromRGB(0x33FFFF)];
                [labelTxt setFont:fontWithSize(16)];
                labelTxt.text = [serviceListArray objectAtIndex:indexPath.row - 1];
                [expandedCell addSubview:labelTxt];

                return expandedCell;
            }
            else{
                [arrowImage setImage:[UIImage imageNamed:@"arrow_true"]];
            return requiredServiceCell;
            }
            break;

        case 3:
            return commentCell;
            break;
        case 4:
            {
                static NSString *pickUpCellIdentifier = @"Cell";

                switch (indexPath.row) {
                    case 0:{
                        CDNewServiceCell *pickUpCell = [tableView dequeueReusableCellWithIdentifier:pickUpCellIdentifier];
                        //if (pickUpCell == nil) {
                        pickUpCell = [CDNewServiceCell getNewServiceCell];
                        //}

                        [pickUpCell.cellTextLabel setText:@"Pick up required?"];
                        [pickUpCell.switchYesOrNo setHidden:NO];
                        [pickUpCell.switchYesOrNo setTag:pickUpCellSwitch];
                        [pickUpCell.switchYesOrNo addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
                        [pickUpCell.switchYesOrNo setOn:isExpandedPickUpCell];
                        return pickUpCell;
                        break;
                    }
                    case 1:{
                       // static NSString *pickUpCellIdentifier = @"Cell";
                        CDNewServiceCell *pickUpCell = [tableView dequeueReusableCellWithIdentifier:pickUpCellIdentifier];
                        //if (pickUpCell == nil) {
                        pickUpCell = [CDNewServiceCell getNewServiceCell];
                        //}

                        [pickUpCell.cellTextField setPlaceholder:@"Pick up time"];
                        [pickUpCell.cellTextField setHidden:NO];
                        return pickUpCell;
                        break;
                    }
                    case 2:
//                        [pickUpCell.cellTextField setPlaceholder:@"Pick up place"];
//                        [pickUpCell.cellTextField setHidden:NO];
//                        return pickUpCell;
                        return pickUpPlaceCell;
                        break;
                        
                    default:
                        break;
                }
                 
            }
            break;
        case 5:
        {
            static NSString *pickUpCellIdentifier = @"Cell";
            switch (indexPath.row) {
                case 0:{
                    CDNewServiceCell *pickUpCell = [tableView dequeueReusableCellWithIdentifier:pickUpCellIdentifier];
                    //if (pickUpCell == nil) {
                    pickUpCell = [CDNewServiceCell getNewServiceCell];
                    //}
                    
                    [pickUpCell.cellTextLabel setText:@"Delivery required?"];
                    [pickUpCell.switchYesOrNo setHidden:NO];
                    [pickUpCell.switchYesOrNo setTag:dropCellSwitch];
                    [pickUpCell.switchYesOrNo setOn:isExpandedDropCell];
                    [pickUpCell.switchYesOrNo addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
                    return pickUpCell;
                    break;
                }
                case 1:
//                    CDNewServiceCell *pickUpCell = [tableView dequeueReusableCellWithIdentifier:pickUpCellIdentifier];
//                    //if (pickUpCell == nil) {
//                    pickUpCell = [CDNewServiceCell getNewServiceCell];
//                    //}
//                    
//                    [pickUpCell.cellTextField setPlaceholder:@"Delivery place"];
//                    [pickUpCell.cellTextField setHidden:NO];
                    return deliveryPlaceCell;
                    break;
            
                    
                default:
                    break;
            }
            
        }
            break;
        default:
            break;
            }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Service type";
            break;
        case 1:
            return @"Service availability";
            break;
        case 2:
            return @"Required service";
            break;
        case 3:
            return @"Service comment";
            break;
        case 4:
            return @"Pick up info";
            break;
        case 5:
            return @"Delivery info";
            break;
        default:
            break;
    }
    return nil;
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
    
    if (indexPath.section == 1 &&  indexPath.row == 0) {
        CDDealerSelectionViewController *dealerSelectionVC = [[CDDealerSelectionViewController alloc]initWithNibName:@"CDDealerSelectionViewController" bundle:nil];
        dealerSelectionVC.isPushed = YES;
        [self.navigationController pushViewController:dealerSelectionVC animated:YES];
    }
    else if(indexPath.section == 2 && indexPath.row == 0){
        if (isExpandedView) {
            isExpandedView = NO;
        }
        else{
            isExpandedView = YES;
        }
        [serviceTable reloadData];
    }
}


- (void)switchValueChanged:(id)sender{
    UISwitch *zSwitch = (UISwitch*)sender;
    if (zSwitch.tag == pickUpCellSwitch) {
        isExpandedPickUpCell ? (isExpandedPickUpCell = NO):(isExpandedPickUpCell = YES);
        [serviceTable reloadData];
    }
    else if (zSwitch.tag == dropCellSwitch){
        isExpandedDropCell ? (isExpandedDropCell = NO):(isExpandedDropCell = YES);
        [serviceTable reloadData];
    }
}

- (void)datePickerViewDoneWithDateString:(NSString *)dateString{
    NSLog(@"Date selected is: %@",dateString);
    dateSelected = dateString;
    [serviceTable reloadData];
    //[dateBtn setTitle:dateString forState:UIControlStateNormal];
}

- (void)viewDidUnload {
    commentCell = nil;
    serviceTable = nil;
    serviceTypeCell = nil;
    serviceAvailabilityCell = nil;
    cell = nil;
    requiredServiceCell = nil;
    //serviceListLabel = nil;
    countLabel = nil;
    arrowImage = nil;
    pickUpPlaceCell = nil;
    deliveryPlaceCell = nil;
  [super viewDidUnload];
}

- (void)closeTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneTapped:(id)sender{
    if (isPushed)
        [self.navigationController popViewControllerAnimated:YES];
    else
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)serviceTypeSelected:(id)sender {
    if(serviceTypeButton){
        [serviceTypeButton setImage:nil forState:UIControlStateNormal];
    }
    UIButton *button = (UIButton*)sender;
    if (button.currentImage == nil) {
        serviceTypeButton = button;
        [button setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateNormal];
       // totalAmount += [[[servicesList objectAtIndex:button.tag] objectForKey:@"amount"] integerValue];
    }
    else{
        [button setImage:nil forState:UIControlStateNormal];
     //   totalAmount -= [[[servicesList objectAtIndex:button.tag] objectForKey:@"amount"] integerValue];
    }
  //  totalAmountLabel.text = [NSString stringWithFormat:@"%d",totalAmount];
}

- (IBAction)dateSelected:(id)sender {
    if(dateButton){
        [dateButton setImage:nil forState:UIControlStateNormal];
    }
    UIButton *button = (UIButton*)sender;
    if (button.currentImage == nil) {
        dateButton = button;
        [button setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateNormal];
    }
    else{
        [button setImage:nil forState:UIControlStateNormal];
    }

}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    serviceListArray = nil;
    CDSelectServiceViewController *selectServiceVC = [[CDSelectServiceViewController alloc]initWithNibName:@"CDSelectServiceViewController" bundle:nil];
    selectServiceVC.delegate = self;
        [self.navigationController pushViewController:selectServiceVC animated:YES];
}

- (void)selectedServices:(NSArray*)array{
    serviceListArray = array;
    [serviceTable reloadData];
}
@end
