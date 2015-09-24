//
//  ViewController.m
//  RadarAnimationDemo
//
//  Created by shanpengtao on 15/5/12.
//  Copyright (c) 2015年 shanpengtao. All rights reserved.
//

#import "ViewController.h"
#import "RadarCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RadarCustomView *radarLoadingView = [[RadarCustomView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:radarLoadingView];
    
    [radarLoadingView showRadarLoadingView];
    
//    [radarLoadingView performSelector:@selector(hideRadarLoadingView) withObject:nil afterDelay:8];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
