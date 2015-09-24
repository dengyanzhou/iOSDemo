//
//  CubeFlipPage.m
//  IOS_3D_UI
//
//  Created by  on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CubeFlipPage.h"
#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

#define FLIPANGLE 60

@interface CubeFlipPage ()
{
    NSTimer* _timer;
    int _step;
    bool _go;
}

- (void)update;
- (void)setFlipAngle:(float)angle;

@end

@implementation CubeFlipPage
@synthesize view0;
@synthesize view1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setView0:nil];
    [self setView1:nil];
    [super viewDidUnload];
    
    [_timer invalidate];
    [_timer release];
    _timer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [view0 release];
    [view1 release];
    [super dealloc];
}

- (IBAction)buttonPressed:(UIButton *)sender 
{
    if (_timer == nil)
    {
        _go = sender.tag == 0;
        _timer = [[NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(update) userInfo:nil repeats:YES] retain];
    }
}

- (void)update
{
    float angle = _step / (float)FLIPANGLE * M_PI / 3.0f;
    if (!_go)
    {
        angle = M_PI/3.0f-angle;
    }
    
    [self setFlipAngle:angle];
 
    _step ++;
    if (_step > FLIPANGLE)
    {
        [_timer invalidate];
        [_timer release];
        _timer = nil;
        _step = 0;
    }
}

- (void)setFlipAngle:(float)angle
{
    float dis = 160 * 1.732f;
    CATransform3D move = CATransform3DMakeTranslation(0, 0, dis);
    CATransform3D back = CATransform3DMakeTranslation(0, 0, -dis);
    
    CATransform3D rotate0 = CATransform3DMakeRotation(-angle, 0, 1, 0);
    CATransform3D rotate1 = CATransform3DMakeRotation(-angle + M_PI/3.0f, 0, 1, 0);
    
    CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move, rotate0), back);
    CATransform3D mat1 = CATransform3DConcat(CATransform3DConcat(move, rotate1), back);
    
    view0.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 500);
    view1.layer.transform = CATransform3DPerspect(mat1, CGPointZero, 500);
}

@end
