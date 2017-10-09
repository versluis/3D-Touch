# 3D Touch
iOS 9 Demo showing how to use 3D Touch on compatible devices in both Objective-C and Swift 3.

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

### Workspace Organisation
This repo contains both an Objective-C and a Swift version of the project. I've added them both to the same Workspace to centralise and make it more practical to work with either project. Just in case you're not familiar with Workspaces in Xcode, here's how they work:

Instead of opening the respective .xcproj file, open 3D-Touch.xcworkspace. You'll then see two projects: 
  * 3D Touch (that's the Objective-C version), and 
  * 3D Touch Swift (that's the Swift version). 
  
You can switch between each version at the top of the screen (next to the play/stop button in Xcode) and choose a different simuluator and target device for each project. You can build and focus on a single project at a time this way, but still maintain multiple projects in the same repository.
