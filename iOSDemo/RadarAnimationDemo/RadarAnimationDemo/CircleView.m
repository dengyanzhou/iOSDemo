//
//  CircleView.m
//  Circle
//
//  Created by Chentao on 15/5/18.
//  Copyright (c) 2015年 Chentao. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor blackColor];
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	CGFloat width = self.bounds.size.width;
	CGFloat height = self.bounds.size.height;

	CGFloat startAngle = -M_PI*3/4;
	CGFloat endAngle = -M_PI/3;

	CGPoint centerPoint = CGPointMake(0.5 * width, 0.5 * height);

	CGFloat radius = MIN(0.5 * width, 0.5 * height);

	CGFloat count = 120;
	CGFloat step = (endAngle - startAngle) / count;


	UIBezierPath *path = nil;
	for (int i = 0; i <= count; i++) {
		path = [UIBezierPath bezierPath];
		path.lineWidth = 0.5;
		[path moveToPoint:centerPoint];

		CGFloat angle = startAngle + i * step;

		[path addLineToPoint:CGPointMake(centerPoint.x + radius * cos(angle), centerPoint.y + radius * sin(angle))];

        [[[UIColor whiteColor] colorWithAlphaComponent:(float)i*0.4/count] setStroke];
        
		[path stroke];
	}
}


@end
