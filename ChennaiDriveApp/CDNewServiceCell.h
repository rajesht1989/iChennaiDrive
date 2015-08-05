//
//  CDNewServiceCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDNewServiceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchYesOrNo;
@property (weak, nonatomic) IBOutlet UITextField *cellTextField;

+ (CDNewServiceCell*)getNewServiceCell;

@end
