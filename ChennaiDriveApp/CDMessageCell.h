//
//  CDMessageCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 5/26/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDMessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblSender;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
+ (CDMessageCell*)getMessageCell;
@end
