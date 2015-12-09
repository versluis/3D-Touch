//
//  CommitViewController.swift
//  3D Touch Swift
//
//  Created by Jay Versluis on 04/12/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

import UIKit

class CommitViewController: UIViewController {
    
    lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer.init(target: self, action: "dismissMe")
        // self.view.addGestureRecognizer(tap)
        return tap
}()

    override func viewDidLoad() {
        super.viewDidLoad()

        // add tap gesture to dismiss this view
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissMe() {
        
        // dismiss this view controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
