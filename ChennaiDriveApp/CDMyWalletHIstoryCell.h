//
//  CDMyWalletHIstoryCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDMyWalletHIstoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageTypeOfTrans;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


+ (CDMyWalletHIstoryCell*)getMyWalletHistoryCell;

@end
