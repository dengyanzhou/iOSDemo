//
//  PerspectRotate.m
//  IOS_3D_UI
//
//  Created by  on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PerspectRotate.h"
#import <QuartzCore/QuartzCore.h>
#import "CATransform3DPerspect.h"

@interface PerspectRotate()
{
    NSTimer* _animTimer;
}
@end

@implementation PerspectRotate
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    image.backgroundColor = [UIColor yellowColor];
    image.image = nil;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)update
{
    static float angle = 0;
    angle += 0.05f;
    
    CATransform3D transloate = CATransform3DMakeTranslation(0, 0, -200);
    CATransform3D rotate = CATransform3DMakeRotation(angle, 0, 1, 0);
    CATransform3D mat = CATransform3DConcat(rotate, transloate);
    image.layer.transform = CATransform3DPerspect(mat, CGPointMake(0, 0), 500);
}

- (void)stopAnimation
{
    [_animTimer invalidate];
    _animTimer = nil;
}

- (IBAction)buttonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    switch (btn.tag) 
    {
        case 0:
            [self stopAnimation];
            image.layer.transform = CATransform3DIdentity;
            break;
            
        case 1:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 1, 0, 0);
            image.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }
        
        case 2:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 0, 1, 0);
            image.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }
        
        case 3:
        {
            [self stopAnimation];
            
            CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
            image.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 200);
            break;
        }    
        
        case 4:
        {
            if (_animTimer==nil)
            {
                _animTimer = [[NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(update) userInfo:nil repeats:YES] retain];
            }
        }
        default:
            break;
    }
}



- (void)dealloc {
    [image release];
    [super dealloc];
}
@end
