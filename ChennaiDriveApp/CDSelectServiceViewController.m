//
//  CDSelectServiceViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDSelectServiceViewController.h"
#import "CDSelectServicesCell.h"

@interface CDSelectServiceViewController ()

@end

@implementation CDSelectServiceViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Select services", @"Select sevices");
        //[self.navigationItem setTitleViewWithTitle:self.title];
//        
//        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
        [self.navigationItem setRightBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"Done" target:self action:@selector(doneTapped:)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    totalAmountLabel.text = @"0";
    
    servicesArray = [[NSMutableArray alloc]init];

    servicesList = [[NSMutableArray alloc]init];
    NSMutableDictionary *serviceDict = [[NSMutableDictionary alloc]init];
    [serviceDict setValue:@"Water service" forKey:@"service"];
    [serviceDict setValue:@"100" forKey:@"amount"];
    [servicesList addObject:serviceDict];

     serviceDict = [[NSMutableDictionary alloc]init];
    [serviceDict setValue:@"Oil change" forKey:@"service"];
    [serviceDict setValue:@"250" forKey:@"amount"];
    [servicesList addObject:serviceDict];
    
    serviceDict = [[NSMutableDictionary alloc]init];
    [serviceDict setValue:@"Chain service" forKey:@"service"];
    [serviceDict setValue:@"200" forKey:@"amount"];
    [servicesList addObject:serviceDict];
    
    serviceDict = [[NSMutableDictionary alloc]init];
    [serviceDict setValue:@"Break oil" forKey:@"service"];
    [serviceDict setValue:@"400" forKey:@"amount"];
    [servicesList addObject:serviceDict];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [servicesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDSelectServicesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDSelectServicesCell getSelectServicesCell];
        [cell.selectBtn addTarget:self action:@selector(serviceSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cell.selectBtn setTag:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.serviceLabel setText:[[servicesList objectAtIndex:indexPath.row] objectForKey:@"service"]];
    [cell.amounLabel setText:[[servicesList objectAtIndex:indexPath.row] objectForKey:@"amount"]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDSelectServicesCell *cell = (CDSelectServicesCell*)[tableView cellForRowAtIndexPath:indexPath];
    [self serviceSelected:cell.selectBtn];
    
}

- (void)serviceSelected:(id)sender {
    UIButton *button = (UIButton*)sender;
    if (button.currentImage == nil) {
        [button setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateNormal];
        totalAmount += [[[servicesList objectAtIndex:button.tag] objectForKey:@"amount"] integerValue];
        [servicesArray addObject:[[servicesList objectAtIndex:button.tag] objectForKey:@"service"]];
    }
    else{
        [button setImage:nil forState:UIControlStateNormal];
        totalAmount -= [[[servicesList objectAtIndex:button.tag] objectForKey:@"amount"] integerValue];
        [servicesArray removeObject:[[servicesList objectAtIndex:button.tag] objectForKey:@"service"]];
    }
    totalAmountLabel.text = [NSString stringWithFormat:@"%d",totalAmount];
}


- (void)viewDidUnload {
    totalAmountLabel = nil;
    [super viewDidUnload];
}

- (void)doneTapped:(id)sender{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Profile has been edited successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
//}
    [delegate selectedServices:servicesArray];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{    [self.navigationController popViewControllerAnimated:YES];
}

@end
