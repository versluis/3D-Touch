//
//  AppDelegate.swift
//  3D Touch Swift
//
//  Created by Jay Versluis on 04/12/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.createShortcutItemsWithIcons()
        
        // determine whether we've launched from a shortcut item or not
        let item = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey]
        if item != nil {
            print("We've launched from a shortcut item: ", item?.localizedTitle)
        } else {
            print("We've launched properly.")
        }
        
        // launch specific vew controllers
        if item?.type == "com.test.deep1" {
            self.launchViewController1()
        }
        
        if item?.type == "com.test.deep2" {
            self.launchViewController2()
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: Springboard Shortcut Items (dynamic)
    
    func createShortcutItemsWithIcons() {
        
        // create some icons with my own images
        let icon1 = UIApplicationShortcutIcon.init(templateImageName: "iCon1")
        let icon2 = UIApplicationShortcutIcon.init(templateImageName: "iCon2")
        let icon3 = UIApplicationShortcutIcon.init(templateImageName: "iCon3")
        
        // create dynamic shortcut items
        let item1 = UIMutableApplicationShortcutItem.init(type: "com.test.dynamic", localizedTitle: "Dynamic Shortcut", localizedSubtitle: "available after first launch", icon: icon1, userInfo: nil)
        let item2 = UIMutableApplicationShortcutItem.init(type: "com.test.deep1", localizedTitle: "Deep Link 1", localizedSubtitle: "Launch Nav Controller", icon: icon2, userInfo: nil)
        let item3 = UIMutableApplicationShortcutItem.init(type: "com.test.deep2", localizedTitle: "Launch 2nd", localizedSubtitle: "Launch 2nd Level", icon: icon3, userInfo: nil)
        
        // add all items to an array
        let items = [item1, item2, item3] as Array
        
        // add this array to the potentially existing static UIApplicationShortcutItems
        let existingItems: Array = UIApplication.sharedApplication().shortcutItems! as Array
        let updatedItems: Array = existingItems + items
        UIApplication.sharedApplication().shortcutItems = updatedItems
   
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        // react to shortcut item selections
        print("A shortcut item was pressed. It was ", shortcutItem.localizedTitle)
        
        // have we launched Deep Link 1?
        if shortcutItem.type == "com.test.deep1" {
            self.launchViewController1()
        }
        
        // have we launched Deep Link 1?
        if shortcutItem.type == "com.test.deep2" {
            self.launchViewController2()
        }
    }
    
    func launchViewController1 () {
        
        // grab our storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        // and instantiate our nav controller
        let controller = storyboard.instantiateViewControllerWithIdentifier("DeepNav")
        
        // make it the root view controller
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
    
    func launchViewController2 () {
        
        // grab our storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        // and instantiate our nav controller
        let controller = storyboard.instantiateViewControllerWithIdentifier("DeepNav") as! UINavigationController
        
        // instantiate the second level view controller
        let levelTwo = storyboard.instantiateViewControllerWithIdentifier("DeepLink2")
        
        // push this controller onto the navigation stack
        controller.pushViewController(levelTwo, animated: false)
        
        // make the nav controller the new root view controller
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        
    }
    
    
}

