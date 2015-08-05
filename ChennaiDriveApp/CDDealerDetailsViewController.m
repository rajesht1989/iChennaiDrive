//
//  CDDealerDetailsViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDDealerDetailsViewController.h"
#import "CDUserCommentCell.h"

@interface CDDealerDetailsViewController ()

@end

@implementation CDDealerDetailsViewController

@synthesize dealerDict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Dealer details", @"Dealer details");
        //[self.navigationItem setTitleViewWithTitle:self.title];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        [shopImage setImage:[UIImage imageNamed:[dealerDict objectForKey:@"dealerType"]]];
        [nameLabel setText:[dealerDict objectForKey:@"name"]];
        [addressLabel setText:@"1st main road"];
        [address2Label setText:[dealerDict objectForKey:@"address"]];
        [phoneLabel setText:[dealerDict objectForKey:@"phone"]];
        [ratingImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ Star",[dealerDict objectForKey:@"rating"]]]];
    
    userCommentsArray = [[NSMutableArray alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"m2dsb" forKey:@"userName"];
    [dict setObject:@"12 Apr 2013" forKey:@"date"];
    [dict setObject:@"The service was very gud." forKey:@"Comment"];
    [dict setObject:@"5" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"jhon" forKey:@"userName"];
    [dict setObject:@"08 Apr 2013" forKey:@"date"];
    [dict setObject:@"The service was ok." forKey:@"Comment"];
    [dict setObject:@"3" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"peter" forKey:@"userName"];
    [dict setObject:@"04 Apr 2013" forKey:@"date"];
    [dict setObject:@"The service was gud." forKey:@"Comment"];
    [dict setObject:@"4" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"mosh" forKey:@"userName"];
    [dict setObject:@"01 Apr 2013" forKey:@"date"];
    [dict setObject:@"The service was very gud." forKey:@"Comment"];
    [dict setObject:@"5" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"jm56" forKey:@"userName"];
    [dict setObject:@"27 Mar 2013" forKey:@"date"];
    [dict setObject:@"The service was bad." forKey:@"Comment"];
    [dict setObject:@"1" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"kask" forKey:@"userName"];
    [dict setObject:@"20 Mar 2013" forKey:@"date"];
    [dict setObject:@"The service was very gud." forKey:@"Comment"];
    [dict setObject:@"5" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"raj" forKey:@"userName"];
    [dict setObject:@"12 Mar 2013" forKey:@"date"];
    [dict setObject:@"The service was very gud." forKey:@"Comment"];
    [dict setObject:@"3" forKey:@"rating"];
    [userCommentsArray addObject:dict];
    
    dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"trik" forKey:@"userName"];
    [dict setObject:@"20 Feb 2013" forKey:@"date"];
    [dict setObject:@"The service was very gud." forKey:@"Comment"];
    [dict setObject:@"5" forKey:@"rating"];
    [userCommentsArray addObject:dict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [userCommentsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGSize sizeOfText = [@"The service was very gud." sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
    return sizeOfText.height+65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDUserCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDUserCommentCell getUserCommentCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell designCellWithDictionary:[userCommentsArray objectAtIndex:indexPath.row]];
//    CGSize sizeOfText = [@"The service was very gud." sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(280, 300) lineBreakMode:UILineBreakModeWordWrap];
//    [cell.commentLabel setFrame:CGRectMake(cell.commentLabel.frame.origin.x, cell.commentLabel.frame.origin.x, cell.commentLabel.frame.size.width, sizeOfText.height)];
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"User comments";
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
	
    return view;
}

- (void)viewDidUnload {
    shopImage = nil;
    nameLabel = nil;
    addressLabel = nil;
    address2Label = nil;
    ratingImage = nil;
    phoneLabel = nil;
    [super viewDidUnload];
}
@end
