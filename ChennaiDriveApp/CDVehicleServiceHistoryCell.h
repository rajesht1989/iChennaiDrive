//
//  CDVehicleServiceHistoryCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/31/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDVehicleServiceHistoryCell : UITableViewCell
{
    IBOutlet UILabel        *lblServiceDate;
    IBOutlet UILabel        *lblDealerInfo;
    IBOutlet UILabel        *lblVehicleKms;
    IBOutlet UILabel        *lblServiceInfo;
}

+ (CDVehicleServiceHistoryCell*)getRegisteredVehicleCell;
//-(void)setRegisteredVehicleInfo :(CDRegisteredVehInfo*)vehicleInfo;

@end
