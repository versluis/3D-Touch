//
//  PreviewViewController.swift
//  3D Touch Swift
//
//  Created by Jay Versluis on 04/12/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.check3DTouch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissMe() {
        
        // dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    func check3DTouch() {
        
        // if 3D Touch is not available, add a tap gesture to dismiss this controller
        if self.traitCollection.forceTouchCapability != UIForceTouchCapability.available {
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(PreviewViewController.dismissMe))
            self.view.addGestureRecognizer(tap)
        }
    }
    
    // MARK: Preview Actions
    
    override var previewActionItems : [UIPreviewActionItem] {
    
        // setup a list of preview actions
        let action1 = UIPreviewAction.init(title: "Action 1", style: UIPreviewActionStyle.default) { (UIPreviewAction, UIViewController) -> Void in
            NSLog("Action 1 was selected")
        }
        
        let action2 = UIPreviewAction.init(title: "Destructive Action", style: UIPreviewActionStyle.destructive) { (UIPreviewAction, UIViewController) -> Void in
            NSLog("Destructive Action was selected")
        }
        
        let action3 = UIPreviewAction.init(title: "Selected Action", style: UIPreviewActionStyle.selected) { (UIPreviewAction, UIViewController) -> Void in
            NSLog("Selected Action was selected")
        }
        
        // add them to an array
        let actions = NSArray.init(objects: action1, action2, action3)
        
        // add all actions to a group
        let group = UIPreviewActionGroup.init(title: "Action Group", style: UIPreviewActionStyle.default, actions: actions as! [UIPreviewAction])
        
        // add the group to an array (yes, this is indeed ridiculous)
        let groupedGroup = NSArray.init(object: group)
        
        // and return them (return the array of actions instead to see all items ungrouped)
        return groupedGroup as! [UIPreviewActionItem]

    }

}
