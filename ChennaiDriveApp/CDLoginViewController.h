//
//  CDLoginViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDLoginViewController : UIViewController <UITableViewDelegate>{
    
}

@property(nonatomic,strong)IBOutlet UITableViewCell *userNameCell;
@property(nonatomic,strong)IBOutlet UITableViewCell *passwordCell;
@property(nonatomic,strong)IBOutlet UITableViewCell *rememberMeCell;

@property(nonatomic,strong)IBOutlet UITextField *userNameField;
@property(nonatomic,strong)IBOutlet UITextField *passwordField;
@property(nonatomic,strong)IBOutlet UISwitch *rememberMeSwitch;
@property(nonatomic,strong)IBOutlet UIButton *forgotPassword;
@property(nonatomic,strong)IBOutlet UITableView *loginTable;

- (IBAction)newUserButtonTapped:(id)sender;

- (IBAction)signInTapped:(id)sender;

@end
