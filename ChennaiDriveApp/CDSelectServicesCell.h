//
//  CDSelectServicesCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDSelectServicesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UILabel *serviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *amounLabel;


+ (CDSelectServicesCell*)getSelectServicesCell;

@end
