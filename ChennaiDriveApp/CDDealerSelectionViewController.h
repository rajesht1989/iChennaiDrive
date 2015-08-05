//
//  CDDealerSelectionViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/21/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDealerSelectionViewController : UIViewController{
    __weak IBOutlet UITextField *searchTextField;
    NSMutableArray *dealersArray;

}

@property (assign, nonatomic) BOOL isPushed;
- (IBAction)segmentedControllerValueChanged:(id)sender;
- (IBAction)searchButtonTapped:(id)sender;

- (void)addBarButton;

@end
