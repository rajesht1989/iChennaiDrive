//
//  CDServiceCell.h
//  ChennaiDriveApp
//
//  Created by Rajesh on 5/5/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDServiceCell : UITableViewCell

+ (CDServiceCell*)getServiceCell;
@property (weak, nonatomic) IBOutlet UIImageView *vehicleImage;
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleBrand;
@property (weak, nonatomic) IBOutlet UILabel *lblRegNum;
@property (weak, nonatomic) IBOutlet UILabel *lblDealer;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgServiceType;

@end
