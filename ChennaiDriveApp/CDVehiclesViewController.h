//
//  CDFirstViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDRegisteredVehicleCell.h"

@interface CDVehiclesViewController : UIViewController<UITableViewDelegate>
{
    IBOutlet UITableView *tableRegisteredVehicles;
    IBOutlet UISegmentedControl *segmentVehicleType;
    
    NSMutableArray *bikes;
    NSMutableArray *cars;
    NSMutableArray *vehicles;
    //CDRegisteredVehicleCell *cell;
}

@property(strong,nonatomic)NSMutableArray *vehicles;
@property(strong,nonatomic)IBOutlet UITableView *tableRegisteredVehicles;
@property(strong,nonatomic)IBOutlet UISegmentedControl *segmentVehicleType;

-(IBAction)segmenteVehicleTypeChanged:(id)sender;
-(IBAction)addNewVehicleTapped:(id)sender;

-(void)configUI;

-(IBAction)serviceRequestedForVehicle:(id)sender;


@end

