//
//  UINavigationController+CDNavigationController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/13/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "UINavigationController+CDNavigationController.h"

@implementation UINavigationController (CDNavigationController)

- (id)initWithBlackNavigationBarAndRootViewController:(UIViewController *)rootViewController{
    UINavigationController *navigationCntroller = [self initWithRootViewController:rootViewController];
    [[navigationCntroller navigationBar] setTintColor:UIColorFromRGB(0x838383)];
    [[navigationCntroller navigationBar] setBackgroundImage:[UIImage imageNamed:@"title_bar"] forBarMetrics:UIBarMetricsDefault];
    return navigationCntroller;
}

@end
