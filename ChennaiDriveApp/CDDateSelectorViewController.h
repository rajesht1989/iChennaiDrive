//
//  CDDateSelectorViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDDateSelectorViewControllerDelegate <NSObject>

- (void)datePickerViewDoneWithDateString:(NSString*)dateString;

@end

@interface CDDateSelectorViewController : UIViewController{
    IBOutlet UIDatePicker *datePicker;
    
}

@property (nonatomic, assign)id<CDDateSelectorViewControllerDelegate> delegate;

- (IBAction)datePickerValueChanged:(id)sender;

@end
