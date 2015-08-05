//
//  CDNewServiceViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CDDateSelectorViewController.h"
#import "CDSelectServiceViewController.h"


@interface CDNewServiceViewController : UIViewController <CDSelectServiceDelegete>{
    
    
    IBOutlet UITableViewCell *serviceTypeCell;
    IBOutlet UITableViewCell *serviceAvailabilityCell;
    IBOutlet UITableViewCell *cell;
    IBOutlet UITableViewCell *requiredServiceCell;
    IBOutlet UITableViewCell *commentCell;
    NSString *dateSelected;
    __weak IBOutlet UITableView *serviceTable;
    BOOL isExpandedView;
    NSArray *serviceListArray;
    __weak IBOutlet UILabel *countLabel;
    __weak IBOutlet UIImageView *arrowImage;
    IBOutlet UITableViewCell *pickUpPlaceCell;
    IBOutlet UITableViewCell *deliveryPlaceCell;
    UIButton *dateButton;
    UIButton *serviceTypeButton;
    BOOL isExpandedPickUpCell;
    BOOL isExpandedDropCell;

  //  __weak IBOutlet UILabel *serviceListLabel;
}

@property (assign, nonatomic) BOOL isPushed;

- (IBAction)serviceTypeSelected:(id)sender;

- (IBAction)dateSelected:(id)sender;
- (void) loadCloseButton;


typedef enum{
    pickUpCellSwitch = 0,
    dropCellSwitch
}typeOfSwitch;


@end
