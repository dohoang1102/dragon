//
//  PageView.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContentController.h"

@interface ContentController ()
@property(strong) UIScrollView *scrollView;
@property(strong) NSMutableArray *pages;
@end

@implementation ContentController

@synthesize scrollView, pages;

- (id)initWithViewFrame:(CGRect)frame
{
  self = [super init];
  if (self) {
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.pages = [NSMutableArray array];
  }
  return self;
}

- (UIView *)view
{
  return self.scrollView;
}

- (void)addPage:(UIViewController *)pageController
{
  int currentNumPages = [self.pages count];
  
  CGRect pageFrame = self.scrollView.frame;
  pageFrame.origin.x = currentNumPages * pageFrame.size.width;
  pageController.view.frame = pageFrame;
  
  [self.pages addObject:pageController];
  [self.scrollView addSubview:pageController.view];
  self.scrollView.contentSize = CGSizeMake(++currentNumPages*pageFrame.size.width, pageFrame.size.height);
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
