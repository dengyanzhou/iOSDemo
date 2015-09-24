//
//  Rotate.m
//  IOS_3D_UI
//
//  Created by  on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Rotate.h"
#import <QuartzCore/QuartzCore.h>

@implementation Rotate
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

- (IBAction)buttonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    switch (btn.tag) 
    {
        case 0:
            image.layer.transform = CATransform3DIdentity;

            break;
        
        case 1:
            image.layer.transform = CATransform3DMakeRotation(M_PI/6, 1, 0, 0);
            break;
            
        case 2:
            image.layer.transform = CATransform3DMakeRotation(M_PI/6, 0, 1, 0);
            break;
            
        case 3:
            image.layer.transform = CATransform3DMakeRotation(M_PI/6, 0, 0, 1);
            break;
            
        default:
            break;
    }
}

- (void)dealloc {
    [image release];
    [super dealloc];
}
@end
