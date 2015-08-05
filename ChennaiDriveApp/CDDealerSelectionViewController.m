//
//  CDDealerSelectionViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDDealerSelectionViewController.h"
#import "CDDealerSelectionCell.h"
#import "CDDealerDetailsViewController.h"


@interface CDDealerSelectionViewController ()

@end

@implementation CDDealerSelectionViewController
@synthesize isPushed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Dealer selection", @"Dealer selection");
        //[self.navigationItem setTitleViewWithTitle:self.title];

    }
    return self;
}
- (void)addBarButton{
    UIBarButtonItem *leftBarButton = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Cancel" target:self action:@selector(closeTapped:)];
    //[[UIBarButtonItem alloc]initWithTitle:@"Colse" style:UIBarButtonItemStyleDone target:self action:@selector(closeTapped:)];
    [self.navigationItem setLeftBarButtonItem:leftBarButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dealersArray = [[NSMutableArray alloc]init];
    NSMutableDictionary *dealerDict = [[NSMutableDictionary alloc]init];
    [dealerDict setObject:@"AD" forKey:@"dealerType"];
    [dealerDict setObject:@"My Honda" forKey:@"name"];
    [dealerDict setObject:@"Velachery" forKey:@"address"];
    [dealerDict setObject:@"9876543210" forKey:@"phone"];
    [dealerDict setObject:@"1" forKey:@"rating"];
    [dealersArray addObject:dealerDict];
    
    dealerDict = [[NSMutableDictionary alloc]init];
    [dealerDict setObject:@"PD" forKey:@"dealerType"];
    [dealerDict setObject:@"Yes Yamaha" forKey:@"name"];
    [dealerDict setObject:@"Thoraipakkam" forKey:@"address"];
    [dealerDict setObject:@"2938476238" forKey:@"phone"];
    [dealerDict setObject:@"4" forKey:@"rating"];
    [dealersArray addObject:dealerDict];
    
    dealerDict = [[NSMutableDictionary alloc]init];
    [dealerDict setObject:@"PD" forKey:@"dealerType"];
    [dealerDict setObject:@"Raj yamaha" forKey:@"name"];
    [dealerDict setObject:@"Sholing" forKey:@"address"];
    [dealerDict setObject:@"2346752899" forKey:@"phone"];
    [dealerDict setObject:@"5" forKey:@"rating"];
    [dealersArray addObject:dealerDict];
    
    dealerDict = [[NSMutableDictionary alloc]init];
    [dealerDict setObject:@"AD" forKey:@"dealerType"];
    [dealerDict setObject:@"Tvs Apple" forKey:@"name"];
    [dealerDict setObject:@"Siruseri" forKey:@"address"];
    [dealerDict setObject:@"9823742699" forKey:@"phone"];
    [dealerDict setObject:@"3" forKey:@"rating"];
    [dealersArray addObject:dealerDict];
    
    dealerDict = [[NSMutableDictionary alloc]init];
    [dealerDict setObject:@"PD" forKey:@"dealerType"];
    [dealerDict setObject:@"ABC pvt" forKey:@"name"];
    [dealerDict setObject:@"T nagar" forKey:@"address"];
    [dealerDict setObject:@"32342323111" forKey:@"phone"];
    [dealerDict setObject:@"2" forKey:@"rating"];
    [dealersArray addObject:dealerDict];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)segmentedControllerValueChanged:(id)sender {
}

- (IBAction)searchButtonTapped:(id)sender {
}

- (void)viewDidUnload {
    searchTextField = nil;
    [super viewDidUnload];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dealersArray count];
}

/**
 *      TableView data source
 **/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Dealer list for honda";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
	
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 0, 300, 20);
    label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
    label.font = fontWithSize(15);
    label.text = sectionTitle;
	
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view addSubview:label];
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDDealerSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDDealerSelectionCell getDealerSelectionCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell designCellWithDictionary:[dealersArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPushed)
    [self.navigationController popViewControllerAnimated:YES];
    else
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    CDDealerDetailsViewController *dealerDetailsVC = [[CDDealerDetailsViewController alloc]initWithNibName:@"CDDealerDetailsViewController" bundle:nil];
    dealerDetailsVC.dealerDict = [dealersArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dealerDetailsVC animated:YES];
}

- (void)closeTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
