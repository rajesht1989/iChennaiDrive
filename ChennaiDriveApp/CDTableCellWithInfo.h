//
//  CDCell.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDTableCellWithInfo;
@protocol CDTableCellWithInfoDelegate <UITextFieldDelegate>

- (void)registrationCellWithInfo:(CDTableCellWithInfo *)cell textFieldValueChanged:(UITextField *)textField;

@end

@interface CDTableCellWithInfo : UITableViewCell<UITextFieldDelegate, UITableViewDelegate>
{
    id<CDTableCellWithInfoDelegate> delegate;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) id<CDTableCellWithInfoDelegate> delegate;



+ (CDTableCellWithInfo*)cellWithInfo;

//- (IBAction)textFieldValueChanged:(id)sender;

@end
