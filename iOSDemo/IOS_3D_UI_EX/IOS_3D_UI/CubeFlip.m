//
//  CubeFlip.m
//  IOS_3D_UI
//
//  Created by  on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CubeFlip.h"
#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

@interface CubeFlip ()
{
    NSTimer* _timer;
}

- (void)setCubeFlipAngle:(float)angle;

@end

@implementation CubeFlip
@synthesize image0;
@synthesize image1;
@synthesize image2;
@synthesize image3;

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
    
    // [self setCubeFlipAngle:M_PI/9];
    _timer = [[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(update) userInfo:nil repeats:YES] retain];
}

- (void)viewDidUnload
{
    [self setImage1:nil];
    [self setImage0:nil];
    [self setImage2:nil];
    [self setImage3:nil];
    [super viewDidUnload];
    
    [_timer invalidate];
    _timer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [image1 release];
    [image0 release];
    [image2 release];
    [image3 release];
    [super dealloc];
}

- (void)setCubeFlipAngle:(float)angle
{
    CATransform3D move = CATransform3DMakeTranslation(0, 0, 160);
    CATransform3D back = CATransform3DMakeTranslation(0, 0, -160);
    
    CATransform3D rotate0 = CATransform3DMakeRotation(-angle, 0, 1, 0);
    CATransform3D rotate1 = CATransform3DMakeRotation(M_PI_2-angle, 0, 1, 0);
    CATransform3D rotate2 = CATransform3DMakeRotation(M_PI_2*2-angle, 0, 1, 0);
    CATransform3D rotate3 = CATransform3DMakeRotation(M_PI_2*3-angle, 0, 1, 0);
    
    CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move, rotate0), back);
    CATransform3D mat1 = CATransform3DConcat(CATransform3DConcat(move, rotate1), back);
    CATransform3D mat2 = CATransform3DConcat(CATransform3DConcat(move, rotate2), back);
    CATransform3D mat3 = CATransform3DConcat(CATransform3DConcat(move, rotate3), back);
    
    image0.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 500);
    image1.layer.transform = CATransform3DPerspect(mat1, CGPointZero, 500);
    image2.layer.transform = CATransform3DPerspect(mat2, CGPointZero, 500);
    image3.layer.transform = CATransform3DPerspect(mat3, CGPointZero, 500);
}

- (void)update
{
    static float angle = 0;
    angle += 0.05;
    [self setCubeFlipAngle:angle];
}

@end
