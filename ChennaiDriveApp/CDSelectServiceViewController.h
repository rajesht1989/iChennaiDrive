//
//  CDSelectServiceViewController.h
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDSelectServiceDelegete <NSObject>

- (void)selectedServices:(NSArray*)array;

@end

@interface CDSelectServiceViewController : UIViewController{
    NSMutableArray *servicesList;
    NSInteger totalAmount;
    __weak IBOutlet UILabel *totalAmountLabel;
    NSMutableArray *servicesArray;
}

@property (nonatomic, assign)id<CDSelectServiceDelegete> delegate;

@end
