//
//  CDDealerDetailsViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDealerDetailsViewController : UIViewController{
    NSMutableArray *userCommentsArray;
    __weak IBOutlet UIImageView *shopImage;
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *addressLabel;
    __weak IBOutlet UILabel *address2Label;
    __weak IBOutlet UIImageView *ratingImage;
    __weak IBOutlet UILabel *phoneLabel;
}
@property (nonatomic, retain)NSDictionary *dealerDict;
@end
