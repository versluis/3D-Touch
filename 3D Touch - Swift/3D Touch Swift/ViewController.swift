//
//  ViewController.swift
//  3D Touch Swift
//
//  Created by Jay Versluis on 04/12/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    lazy var longPress: UILongPressGestureRecognizer = {
        let temp = UILongPressGestureRecognizer.init(target: self, action: #selector(ViewController.showPeek))
        // self.view.addGestureRecognizer(longPress)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // check if 3D Touch is available
        self.check3DTouch()
    }
    
    func check3DTouch() {
        
        // register for 3D Touch (if available)
        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            
            self.registerForPreviewing(with: self, sourceView: self.view)
            print("3D Touch is available. Excellent!")
            
            // and disable the long press gesture
            self.longPress.isEnabled = false

        } else {
            
            print("3D Touch is not available. Dang!")
            
            // handle alternative long press recogniser
            self.longPress.isEnabled = true
            
        }
    }

    // MARK: 3D Touch Delegate
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // check if we're not already showing a preview
        if ((self.presentedViewController?.isKind(of: PreviewViewController.self)) != nil) {
            return nil
        }
        
        // PEEK (shallow press): return the preview view controller here
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let previewView = storyboard.instantiateViewController(withIdentifier: "PreviewView")
        
        return previewView
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        // POP (deep press): return the commit view controller here
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let commitView = storyboard.instantiateViewController(withIdentifier: "CommitView")
        
        self.show(commitView, sender: self)
        
        // alternatively, use the view controller that's being provided here (viewControllerToCommit)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        // called when the interface environment changes
        // one of those occasions would be if the user enables/disables 3D Touch
        // so we'll simply check again at this point
        self.check3DTouch()
    }
    
    // MARK: 3D Touch Alternative
    
    @objc func showPeek() {
        
        print("showing peek")
        
        // disable long press gesture so it's not called mutiple times
        self.longPress.isEnabled = false
        
        // present the preview (peek)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let previewView = storyboard.instantiateViewController(withIdentifier: "PreviewView")
        
        let presenter = self.grabTopViewController()
        presenter.show(previewView, sender: self)
        
    }
    
    func grabTopViewController() -> UIViewController {
        
        // helper method to always give the top most view controller
        // avoids "view is not in the window hierarchy" error
        // http://stackoverflow.com/questions/26022756/warning-attempt-to-present-on-whose-view-is-not-in-the-window-hierarchy-sw
        
        var top = UIApplication.shared.keyWindow?.rootViewController
        while ((top?.presentedViewController) != nil) {
            top = top?.presentedViewController
        }
        
        return top!
    }

}

