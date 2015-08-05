//
//  CDRegisteredVehicleCells.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/28/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDRegisteredVehInfo.h"

@interface CDRegisteredVehicleCell : UITableViewCell
{
    IBOutlet UIImageView    *imgVehicle;
    IBOutlet UILabel        *lblVehicleName;
    IBOutlet UILabel        *lblVehicleRegNo;
    IBOutlet UILabel        *lblDueDateTitle;
    IBOutlet UILabel        *lblDueDate;
    //IBOutlet UIButton       *btnServiceMe;
    
}
//
//@property(nonatomic, weak) IBOutlet UIImageView   *imgVehicle;
//@property(nonatomic, weak) IBOutlet UILabel       *lblVehicleName;
//@property(nonatomic, weak) IBOutlet UILabel       *lblVehicleRegNo;
//@property(nonatomic, weak) IBOutlet UILabel       *lblDueDateTitle;
//@property(nonatomic, weak) IBOutlet UILabel       *lblDueDate;
@property(nonatomic, weak) IBOutlet UIButton      *btnServiceMe;

+ (CDRegisteredVehicleCell*)getRegisteredVehicleCell;
-(void)setRegisteredVehicleInfo :(CDRegisteredVehInfo*)vehicleInfo;


@end
