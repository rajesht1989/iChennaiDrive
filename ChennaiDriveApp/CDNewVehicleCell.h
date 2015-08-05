//
//  CDNewVehicleCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDNewVehicleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *districtField;
@property (weak, nonatomic) IBOutlet UITextField *thirdField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;

+ (CDNewVehicleCell*)getNewVehicleCell;

@end
