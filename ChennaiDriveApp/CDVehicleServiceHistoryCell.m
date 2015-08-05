//
//  CDVehicleServiceHistoryCell.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/31/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDVehicleServiceHistoryCell.h"
#define CDVehicleServiceHistoryCellIdentifier @"CDVehicleServiceHistoryCell"

@interface CDVehicleServiceHistoryCell ()

@end

@implementation CDVehicleServiceHistoryCell

+ (CDVehicleServiceHistoryCell*)getRegisteredVehicleCell{
    CDVehicleServiceHistoryCell *cell;
    NSArray *topLevelsObjects = [[NSBundle mainBundle] loadNibNamed:CDVehicleServiceHistoryCellIdentifier owner:nil options:nil];
    for(id currentObject in topLevelsObjects)
    {
        if([currentObject isKindOfClass:[UITableViewCell class]])
        {
            cell = (CDVehicleServiceHistoryCell *)currentObject;
            break;
        }
    }
    return cell;
}

@end
