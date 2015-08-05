//
//  CDEventsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDEventsViewController.h"
#import "CDEventDetailsViewController.h"
#import "CDOffersCell.h"

@interface CDEventsViewController ()

@end

@implementation CDEventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Offers", @"Offers");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        self.tabBarItem.image = [UIImage imageNamed:@"tab2"];
    }
    offersArray = [NSMutableArray array];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"My honda - Velachery" forKey:@"sender"];
    [dictionary setObject:@"Get 10% discount till friday" forKey:@"message"];
    [offersArray addObject:dictionary];
    dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"Apple TVS - SRP" forKey:@"sender"];
    [dictionary setObject:@"Weekend offer - Rs 100 cash back." forKey:@"message"];
    [offersArray addObject:dictionary];

    //offersArray = @[@"Get 10% discount till friday",@"Weekend offer - Rs 100 cash back."];
    //eventsArray = @[@"Hero launches new bike on 12th this month",@"New ABS Bike"];
    self.tabBarItem.badgeValue = [offersArray count] + [eventsArray count] != 0?[NSString stringWithFormat:@"%d",[offersArray count] + [eventsArray count]]:nil;

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [offersArray count] + [eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDOffersCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDOffersCell getOffersCell];
    }
    [cell.lblAddress setText:[[offersArray objectAtIndex:indexPath.row] objectForKey:@"sender" ]];    
    [cell.lblMessage setText:[[offersArray objectAtIndex:indexPath.row] objectForKey:@"message" ]];
//    NSArray *fullArray = [offersArray arrayByAddingObjectsFromArray:eventsArray];
//    cellLabel.text = [fullArray objectAtIndex:indexPath.row];
//    if (indexPath.row < [offersArray count]) {
//        [imageView setImage:[UIImage imageNamed:@"Offer.png"]];
//    }
//    else{
//        [imageView setImage:[UIImage imageNamed:@"Event.png"]];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDEventDetailsViewController *eventDetailsVC = [[CDEventDetailsViewController alloc]initWithNibName:@"CDEventDetailsViewController" bundle:nil];
    
    if (indexPath.row < [offersArray count]) {
        //Set parameters for offer
    }
    else{
        //Set parameters for events

    }
    [self.navigationController pushViewController:eventDetailsVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}
@end
