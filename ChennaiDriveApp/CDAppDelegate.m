//
//  CDAppDelegate.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDAppDelegate.h"

#import "CDVehiclesViewController.h"

#import "CDServiceViewController.h"

#import "CDLoginViewController.h"

#import "CDEventsViewController.h"

#import "CDMyWalletViewController.h"

#import "CDMoreViewController.h"

#import "CDMessagesViewController.h"

#import "UINavigationController+CDNavigationController.h"

@implementation CDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutTapped:) name:@"logout" object:nil];

    UIViewController *vehiclesViewController = [[CDVehiclesViewController alloc] initWithNibName:@"CDVehiclesViewController" bundle:nil];
    
    UIViewController *serviceViewController = [[CDServiceViewController alloc] initWithNibName:@"CDServiceViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    
    UIViewController *eventsViewController = [[CDEventsViewController alloc]initWithNibName:@"CDEventsViewController" bundle:nil];
    
    //UIViewController *myWalletViewController = [[CDMyWalletViewController alloc]initWithNibName:@"CDMyWalletViewController" bundle:nil];
    
    UIViewController *messagesVC = [[CDMessagesViewController alloc]initWithNibName:@"CDMessagesViewController" bundle:nil];

    UIViewController *moreViewController = [[CDMoreViewController alloc]initWithNibName:@"CDMoreViewController" bundle:nil];
    
   
    UINavigationController *vehiclesNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:vehiclesViewController];
    
    UINavigationController *servicesNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:serviceViewController];
    
    UINavigationController *eventsNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:eventsViewController];
    
    UINavigationController *messagesNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:messagesVC];
    
    UINavigationController *moreNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:moreViewController];
    

    
    
    //UINavigationController *myWalletNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:myWalletViewController];
    
    self.tabBarController.viewControllers = @[vehiclesNavigationController, servicesNavigationController,eventsNavigationController,messagesNavigationController,moreNavigationController];
    
    self.window.rootViewController = self.tabBarController;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:nil];
    
    return YES;
}

- (void)logoutTapped:(id)sender{
    CDLoginViewController *loginViewController = [[CDLoginViewController alloc]initWithNibName:@"CDLoginViewController" bundle:nil];
    
    UINavigationController *loginNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:loginViewController];
    
    [self.window makeKeyAndVisible];
    
    [self.tabBarController setSelectedIndex:0];
    
    [self.tabBarController presentViewController:loginNavigationController animated:NO completion:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
