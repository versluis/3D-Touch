//
//  PreviewViewController.m
//  3D Touch
//
//  Created by Jay Versluis on 21/09/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController () <UIPreviewActionItem>

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


#pragma mark - Preview Actions

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    [super previewActionItems];
    
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 triggered");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Destructive Action" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Destructive Action triggered");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Selected Action" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Selected Action triggered");
    }];
    
    // add them to an arrary
    NSArray *actions = @[action1, action2, action3];
    
    // and return them
    return actions;
}

@end
