//
//  PreviewViewController.m
//  3D Touch
//
//  Created by Jay Versluis on 21/09/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self check3DTouch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissMe{
    
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)check3DTouch {
    
    // if 3D Touch is not available, add a tap gesture to dismiss this view
    if (self.traitCollection.forceTouchCapability != UIForceTouchCapabilityAvailable) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMe)];
        [self.view addGestureRecognizer:tap];
    }
}

@end
