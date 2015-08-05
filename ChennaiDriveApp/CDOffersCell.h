//
//  CDOffersCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 5/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDOffersCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;


+ (CDOffersCell*)getOffersCell;

@end
