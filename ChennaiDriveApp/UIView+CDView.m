//
//  UIView+CDView.m
//  ChennaiDriveApp
//
//  Created by Rajesh on 5/17/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "UIView+CDView.h"

@implementation UIView (CDView)

+ (UIView*)getTableViewSectionViewWithTitle:(NSString*)titleString{
    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 12, 300, 20);
    label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
    label.font = fontWithSize(15);
    label.text = titleString;
	
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [view addSubview:label];
    return view;
}

@end
