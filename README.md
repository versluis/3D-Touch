# 3D Touch
iOS 9 Demo showing how to use 3D Touch on iPhone 6s devices in both Objective-C and Swift.

If 3D Touch is available, the Main View will bring up a Preview View upon shallow press (Peek), and a Commit View when the user presses deeper (Pop).

If 3D Touch is not available, a long press recognizer is implemented and calls the Preview View. Tapping the Preview View will transition back to the Main View. 

Should the user disable 3D Touch while the app is running, the alternative long press recognizer is activated automatically (and disabled again if 3D Touch becomes available again).

I've described how to implement these things in the following two articles: 
 - http://pinkstone.co.uk/how-to-use-3d-touch-in-ios-9-part-1-peek-and-pop/
 - http://pinkstone.co.uk/how-to-use-3d-touch-in-ios-9-part-2-preview-actions/

### Shortcut Items
I've also added static and dynamic shortcut items to this project. I've explained how to do this here: 
 - http://pinkstone.co.uk/3d-touch-in-ios-9-part-3-adding-dynamic-shortcut-items/
 - http://pinkstone.co.uk/3d-touch-in-ios-9-part-4-adding-static-shortcut-items/

### Deep Link Examples
Rather than boring log messages, I've added two options for Deep Linking a navigation controller:
 - Deep Link 1 will launch a navigation controller
 - Deep Link 2 launches a view controller that has been pushed onto the same navigation controller
