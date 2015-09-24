//
//  CubeFlipPage.h
//  IOS_3D_UI
//
//  Created by  on 12-9-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CubeFlipPage : UIViewController
@property (retain, nonatomic) IBOutlet UIView *view0;
@property (retain, nonatomic) IBOutlet UIView *view1;

- (IBAction)buttonPressed:(UIButton *)sender;
@end
