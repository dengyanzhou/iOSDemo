//
//  CircleLayout.h
//  CollectionViewTest
//
//  Created by Aries on 14-8-21.
//  Copyright (c) 2014年 Sagitar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;
@end
