//
//  CDHistoryDetailsViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDHistoryDetailsViewController : UIViewController{
    __weak IBOutlet UILabel *tnxDateLbl;
    __weak IBOutlet UILabel *txnTypeLbl;
    __weak IBOutlet UILabel *txnAmountLbl;
    __weak IBOutlet UILabel *tnnDetailsLbl;
}

@property (nonatomic, retain) NSDictionary *txnDict;

@end
