//
//  CDDealerSelectionCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDealerSelectionCell : UITableViewCell

+ (CDDealerSelectionCell*)getDealerSelectionCell;
@property (weak, nonatomic) IBOutlet UIImageView *dealerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImage;

- (void)designCellWithDictionary:(NSDictionary*)dict;

@end
