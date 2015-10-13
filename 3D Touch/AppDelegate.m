//
//  AppDelegate.m
//  3D Touch
//
//  Created by Jay Versluis on 21/09/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // [self createDynamicShortcutItems];
    [self createItemsWithIcons];
    
    // determine whether we've launched from a shortcut item or not
    UIApplicationShortcutItem *item = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (item) {
        NSLog(@"We've launched from shortcut item: %@", item.localizedTitle);
    } else {
        NSLog(@"We've launched properly.");
    }
    
    // have we launched Deep Link Level 1
    if ([item.type isEqualToString:@"com.test.deep1"]) {
        [self launchViewController1];
    }
    
    // have we launched Deep Link Level 2
    if ([item.type isEqualToString:@"com.test.deep2"]) {
        [self launchViewController2];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark - Springboard Shortcut Items (dynamic)

- (void)createDynamicShortcutItems {
    
    // create several (dynamic) shortcut items
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"Item 1" localizedTitle:@"Item 1"];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"Item 2" localizedTitle:@"Item 2"];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:@"Item 3" localizedTitle:@"Item 3"];
    
    // add all items to an array
    NSArray *items = @[item1, item2, item3];
    
    // add the array to our app
    [UIApplication sharedApplication].shortcutItems = items;
}

- (void)createItemsWithIcons {
    
    // create some system icons (doesn't work)
//    UIApplicationShortcutIcon *loveIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
//    UIApplicationShortcutIcon *mailIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMail];
//    UIApplicationShortcutIcon *prohibitIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeProhibit];
    
    // icons with my own images
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"iCon1"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"iCon2"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"iCon3"];
    
    // create several (dynamic) shortcut items
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.test.dynamic" localizedTitle:@"Dynamic Shortcut" localizedSubtitle:@"available after first launch" icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.test.deep1" localizedTitle:@"Deep Link 1" localizedSubtitle:@"Launch Nav Controller" icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.test.deep2" localizedTitle:@"Deep Link 2" localizedSubtitle:@"Launch 2nd Level" icon:icon3 userInfo:nil];
    
    // add all items to an array
    NSArray *items = @[item1, item2, item3];
    
    // add this array to the potentially existing static UIApplicationShortcutItems
    NSArray *existingItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems = [existingItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = updatedItems;

}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    // react to shortcut item selections
    NSLog(@"A shortcut item was pressed. It was %@.", shortcutItem.localizedTitle);
    
    // have we launched Deep Link Level 1
    if ([shortcutItem.type isEqualToString:@"com.test.deep1"]) {
        [self launchViewController1];
    }
    
    // have we launched Deep Link Level 2
    if ([shortcutItem.type isEqualToString:@"com.test.deep2"]) {
        [self launchViewController2];
    }
    
}

- (void)launchViewController1 {
    
    // grab our storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // and instantiate our navigation controller
    UINavigationController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DeepNav"];
    
    // make it the key window
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
}

- (void)launchViewController2 {
    
    // grab our storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // instantiate our navigation controller
    UINavigationController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DeepNav"];
    
    // instantiate second view controller
    UIViewController *two = [storyboard instantiateViewControllerWithIdentifier:@"DeepLink2"];
    
    // now push both controllers onto the stack
    [controller pushViewController:two animated:NO];
    
    // make the nav controller visible
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
}



@end
