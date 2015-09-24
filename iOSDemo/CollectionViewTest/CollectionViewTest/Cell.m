//
//  Cell.m
//  CollectionViewTest
//
//  Created by Aries on 14-8-21.
//  Copyright (c) 2014年 Sagitar. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.contentView.layer.cornerRadius = 30.0;
        [self.contentView setFrame:CGRectMake(0, 0, 75, 75)];
        self.contentView.backgroundColor = [UIColor blackColor];
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        
//        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_0473.JPG"]];
//        
//        self.imageView.layer.masksToBounds = YES;
//        self.imageView.layer.cornerRadius = 30.0;
//        [self.imageView setFrame:self.contentView.frame];
//        [self.contentView addSubview:self.imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
