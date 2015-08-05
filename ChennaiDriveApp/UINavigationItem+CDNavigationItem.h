//
//  UINavigationItem+CDNavigationItem.h
//  ChennaiDriveApp
//
//  Created by Rajesh on 5/11/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (CDNavigationItem)

- (void)setTitleViewWithTitle:(NSString*)title;

- (UIBarButtonItem*) getBarButtonItemWithImage:(UIImage *)image
                                         title:(NSString *)titleString
                                        target:(id)target
                                        action:(SEL)action;

@end
