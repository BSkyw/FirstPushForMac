//
//  ViewController.m
//  FirstPush
//
//  Created by Wky on 2020/4/9.
//  Copyright © 2020 wangky. All rights reserved.
//

#import "ViewController.h"
#import "TZView.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TZView *vview = [[TZView alloc] initWithFrame:self.view.frame];
//    vview.layer.opaque = NO;
    [self.view addSubview:vview];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
