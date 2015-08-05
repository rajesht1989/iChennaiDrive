//
//  CDRegisteredVehInfoViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDRegisteredVehInfo.h"

@interface CDRegisteredVehInfoViewController : UIViewController<UITableViewDelegate>
{
    IBOutlet UITableView *vehicleServiceHistoryTable;
}

@property (weak,nonatomic)CDRegisteredVehInfo *selectedVehicle;
- (IBAction)serviceMeTapped:(id)sender;

@end
