//
//  CommitViewController.m
//  3D Touch
//
//  Created by Jay Versluis on 25/09/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "CommitViewController.h"

@interface CommitViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation CommitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // add tap gesture recogniser
    [self.view addGestureRecognizer:self.tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissMe {
    
    // dismisses the current view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITapGestureRecognizer *)tap {
    
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMe)];
    }
    return _tap;
}

@end
