//
//  PageView.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageView.h"

@interface PageView ()
@property(strong) NSMutableArray *pages;
@end

@implementation PageView

@synthesize pages;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.pages = [NSMutableArray array];
    
    self.pagingEnabled = YES;
    self.scrollEnabled = YES;
    self.alwaysBounceHorizontal = YES;
    
    self.contentSize = CGSizeMake(frame.size.width*2, frame.size.height*2);
  }
  return self;
}

- (void)addPage:(UIView *)page
{
  int currentNumPages = [self.pages count];
  CGRect pageFrame = self.frame;
  pageFrame.origin.x = currentNumPages * pageFrame.size.width;
  page.frame = pageFrame;
  [self.pages addObject:page];
  
  self.contentSize = CGSizeMake(++currentNumPages*pageFrame.size.width, pageFrame.size.height);
  [self addSubview:page];
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
