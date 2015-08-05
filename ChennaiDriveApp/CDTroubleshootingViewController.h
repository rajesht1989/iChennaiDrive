//
//  CDTroubleshootingViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDTroubleshootingViewController : UIViewController{
    NSArray *troubleshootingArray;
    NSArray *bikesArray;
    NSArray *carsArray;
    __weak IBOutlet UITableView *troubleshootingTableView;
    __weak IBOutlet UISegmentedControl *segmentControl;
}
- (IBAction)sementChanged:(id)sender;

@end
