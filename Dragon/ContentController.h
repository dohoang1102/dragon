//
//  PageView.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentController : NSObject

- (id)initWithViewFrame:(CGRect)frame;

- (UIView *)view;

- (void)addPage:(UIViewController *)pageController;

@end
