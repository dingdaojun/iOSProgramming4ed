//
//  BNRAppDelegate.m
//  Nerdfeed
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    BNRCoursesViewController *cvc = [[BNRCoursesViewController alloc] initWithStyle:UITableViewStylePlain];

    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:cvc];

    BNRWebViewController *wvc = [[BNRWebViewController alloc] init];
    cvc.webViewController = wvc;

    // Check to make sure we are running on the iPad
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {

        // webViewController must be in navigation controller; you will see why later
        UINavigationController *detailNav =
            [[UINavigationController alloc] initWithRootViewController:wvc];
        UISplitViewController *svc = [[UISplitViewController alloc] init];

        // Set the delegate of the split view controller to the detail VC
        // You will need this later - ignore the warning for now
        svc.delegate = wvc;

        svc.viewControllers = @[masterNav, detailNav];

        // Set the root view controller of the window to the split view controller
        self.window.rootViewController = svc;
    } else {
        // On non-iPad devices, just use the navigation controller
        self.window.rootViewController = masterNav;
    }

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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

@end
