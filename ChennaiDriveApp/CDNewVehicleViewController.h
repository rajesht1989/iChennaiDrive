//
//  CDNewVehicleViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDNewVehicleViewController : UIViewController<UITextFieldDelegate>{
    NSArray *textArray;
    NSArray *sectionTitleArray;
}

typedef enum{
    stateField = 0,
    districtField,
    thirdField,
    fourthField
}textFieldType;

@end
