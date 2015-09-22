# 3D Touch
iOS 9 Demo showing how to use 3D Touch on iPhone 6s devices.

If 3D Touch is available, the Main View will bring up a Preview View upon shallow press (Peek), and a Commit View when the user presses deeper (Pop).

If 3D Touch is not available, a long press recognizer is implemented and calls the Preview View. Tapping the Preview View will transition back to the Main View. 

Should the user disable 3D Touch while the app is running, the alternative long press recognizer is activated automatically.
