//
//  CDSecondViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDServiceViewController : UIViewController{
    
    __weak IBOutlet UISegmentedControl *servicesSegment;
    __weak IBOutlet UITableView *serviceTable;
}
- (IBAction)segmentedControllerValueChanged:(id)sender;

@end
