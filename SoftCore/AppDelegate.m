//
//  AppDelegate.m
//  SoftCore
//
//  Created by MacBook Pro Retina on 23/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "HotListViewController.h"
#import "WishListViewController.h"
#import "CustomTabBar.h"

@interface AppDelegate ()
@property(nonatomic,strong)CustomTabBar *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *image = [self getimage];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MainViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    
    UINavigationController *navigationController1 =
    [[UINavigationController alloc] initWithRootViewController:vc];
    
    
    
     HotListViewController*vc1 = [mainStoryboard instantiateViewControllerWithIdentifier:@"HotListViewController"];
    
    
    UINavigationController *navigationController2 =
    [[UINavigationController alloc] initWithRootViewController:vc1];
    
    
    WishListViewController*vc2 = [mainStoryboard instantiateViewControllerWithIdentifier:@"WishListViewController"];
    
    
    UINavigationController *navigationController3 =
    [[UINavigationController alloc] initWithRootViewController:vc2];

    
    self.tabBarController = [[CustomTabBar alloc] init];
     self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1,navigationController2, navigationController3,nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    UITabBarItem *tabBarItem1 = [self.tabBarController.tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [self.tabBarController.tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [self.tabBarController.tabBar.items objectAtIndex:2];
    
    
    [tabBarItem1 initWithTitle:@"Home" image:[UIImage imageNamed:@"home_active"] selectedImage:[UIImage imageNamed:@"home_inactive"]];
    
    
     [tabBarItem2 initWithTitle:@"HOT OFFER" image:[UIImage imageNamed:@"hot_offer_active"] selectedImage:[UIImage imageNamed:@"hot_offer_inactive"]];
    
     [tabBarItem3 initWithTitle:@"WishList" image:[UIImage imageNamed:@"wishlist_active"] selectedImage:[UIImage imageNamed:@"wishlist_inactive"]];
   
   [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBackgroundImage:[self getimage]];
    [[UITabBar appearance]setClipsToBounds:YES];

    
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"select"]==NULL)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"-1" forKey:@"select"];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (UIImage *)getimage {
    UIColor *col=[UIColor colorWithRed:251.0/255.0 green:74.0/355.0 blue:94.0/255.0 alpha:1.0];
    CGRect f=CGRectMake(0, 0, 1200, 1200);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1200, 1200), NO, 0);
    [col setFill];
    UIRectFill(f);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


@end
