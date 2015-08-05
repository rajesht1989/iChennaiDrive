//
//  CDMyWalletViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDMyWalletViewController.h"
#import "CDMyWalletHIstoryCell.h"
#import "CDHistoryDetailsViewController.h"

@interface CDMyWalletViewController ()

@end

@implementation CDMyWalletViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Wallet", @"Wallet");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        self.tabBarItem.image = [UIImage imageNamed:@"tab3"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    myWalletHistoryArray = [[NSMutableArray alloc]init];
    NSMutableDictionary *historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Credit" forKey:@"txnType"];
    [historyDictionary setValue:@"100" forKey:@"amount"];
    [historyDictionary setValue:@"14 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
    historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Credit" forKey:@"txnType"];
    [historyDictionary setValue:@"67" forKey:@"amount"];
    [historyDictionary setValue:@"13 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
    historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Debit" forKey:@"txnType"];
    [historyDictionary setValue:@"30" forKey:@"amount"];
    [historyDictionary setValue:@"12 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
    historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Credit" forKey:@"txnType"];
    [historyDictionary setValue:@"235" forKey:@"amount"];
    [historyDictionary setValue:@"11 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
    historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Debit" forKey:@"txnType"];
    [historyDictionary setValue:@"500" forKey:@"amount"];
    [historyDictionary setValue:@"09 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
    historyDictionary = [[NSMutableDictionary alloc]init];
    [historyDictionary setValue:@"Debit" forKey:@"txnType"];
    [historyDictionary setValue:@"150" forKey:@"amount"];
    [historyDictionary setValue:@"04 Apr 2013" forKey:@"date"];
    [myWalletHistoryArray addObject:historyDictionary];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [myWalletHistoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    CDMyWalletHIstoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [CDMyWalletHIstoryCell getMyWalletHistoryCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.imageTypeOfTrans setImage:[UIImage imageNamed:[[myWalletHistoryArray objectAtIndex:indexPath.row] objectForKey:@"txnType"]]];
    [cell.amount setText:[[myWalletHistoryArray objectAtIndex:indexPath.row] objectForKey:@"amount"]];
    [cell.dateLabel setText:[[myWalletHistoryArray objectAtIndex:indexPath.row] objectForKey:@"date"]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"History";
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
    CDHistoryDetailsViewController *historyDetailsVC = [[CDHistoryDetailsViewController alloc]initWithNibName:@"CDHistoryDetailsViewController" bundle:nil];
    [historyDetailsVC setTxnDict:[myWalletHistoryArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:historyDetailsVC animated:YES];
}


@end
