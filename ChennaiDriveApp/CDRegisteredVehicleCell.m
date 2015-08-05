//
//  CDRegisteredVehicleCells.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/28/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDRegisteredVehicleCell.h"
#import "CDRegisteredVehInfo.h"

#define CDRegisteredVehTableCell @"CDRegisteredVehicleCell"

@interface CDRegisteredVehicleCell ()

@end

@implementation CDRegisteredVehicleCell
@synthesize btnServiceMe;

+ (CDRegisteredVehicleCell*)getRegisteredVehicleCell{
    CDRegisteredVehicleCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:CDRegisteredVehTableCell owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDRegisteredVehicleCell *)currentObject;
            break;
        }
    }
    return cell;
}

-(void)setRegisteredVehicleInfo :(CDRegisteredVehInfo*)vehicleInfo
{
    lblVehicleName.text = [NSString stringWithFormat:@"%@ %@",vehicleInfo.vehicleBrandName,vehicleInfo.vehicleModelName];
    lblVehicleRegNo.text = vehicleInfo.vehicleRegNo;
    imgVehicle.image  = [UIImage imageNamed:vehicleInfo.vehicleImageName];
    lblDueDate.text = @"12/12/2013";
}


@end
