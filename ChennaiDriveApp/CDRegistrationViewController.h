//
//  CDRegistrationViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDTableCellWithInfo.h"

@interface CDRegistrationViewController : UIViewController<UITextFieldDelegate,CDTableCellWithInfoDelegate>
{
     IBOutlet UITableView *registrationTableView;    
}

typedef enum{
    personalDetail= 0,
    accountDetail
}sectionType;

typedef enum{
    userName = 0,
    eMail,
    mobileNo,
    loginName,
    password,
    confirmPassword
}cellType;

- (IBAction)termsAndConditionButtonTapped:(id)sender;
- (IBAction)readTermsAndCondition:(id)sender;


@end
