//
//  CDBrandAndModelViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDBrandAndModelViewController : UIViewController{
    
    IBOutlet UIPickerView *pickerView;
    
    NSArray *brandArray;
    
    NSArray *vehiclesArray;
    __weak IBOutlet UIImageView *brandImageView;
    __weak IBOutlet UILabel *brandLabel;
    
    __weak IBOutlet UILabel *modelLabel;
}

@property (nonatomic, retain)     NSMutableArray *componetViewArray;

//- (IBAction)closeButtonTapped:(id)sender;

@end
