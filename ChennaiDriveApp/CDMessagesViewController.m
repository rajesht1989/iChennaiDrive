//
//  CDMessagesViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMessagesViewController.h"
#import "CDMessageDetailsViewController.h"
#import "CDMessageCell.h"

@interface CDMessagesViewController ()

@end

@implementation CDMessagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Messages", @"Messages");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        self.tabBarItem.image = [UIImage imageNamed:@"Message"];
        //messagesArray = @[@"Your service for Honda has been completed.",@"Your service amount was successfully paid through online."];
        messagesArray = [NSMutableArray array];
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:@"My honda - Velachery" forKey:@"sender"];
        [dictionary setObject:@"13/05/2013" forKey:@"date"];
        [dictionary setObject:@"Your service for Honda has been completed." forKey:@"message"];
        [messagesArray addObject:dictionary];
        dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:@"Apple TVS - SRP" forKey:@"sender"];
        [dictionary setObject:@"10/05/2013" forKey:@"date"];
        [dictionary setObject:@"Your service amount was successfully paid through online." forKey:@"message"];
        [messagesArray addObject:dictionary];
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",[messagesArray count]];
//        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped:)];
//        self.navigationItem.leftBarButtonItem = leftBarButton;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [messagesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDMessageCell getMessageCell];
    }
    cell.lblSender.text = [[messagesArray objectAtIndex:indexPath.row] objectForKey:@"sender"];
    
    cell.lblDate.text = [[messagesArray objectAtIndex:indexPath.row] objectForKey:@"date"];
    
    cell.lblMessage.text = [[messagesArray objectAtIndex:indexPath.row] objectForKey:@"message"];
    
//    if (indexPath.row < [offersArray count]) {
//        [imageView setImage:[UIImage imageNamed:@"Offer.png"]];
//    }
//    else{
//        [imageView setImage:[UIImage imageNamed:@"Event.png"]];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CDMessageDetailsViewController *eventDetailsVC = [[CDMessageDetailsViewController alloc]initWithNibName:@"CDMessageDetailsViewController" bundle:nil];
    
//    if (indexPath.row < [offersArray count]) {
//        //Set parameters for offer
//    }
//    else{
//        //Set parameters for events
//        
//    }
    [self.navigationController pushViewController:eventDetailsVC animated:YES];
}

@end
