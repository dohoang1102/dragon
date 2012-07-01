//
//  OnceUponATime.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OnceUponATime.h"

@implementation OnceUponATime

- (id)init
{
  self = [super init];
  if (self) {      
    UILabel *onceUponATime = [[UILabel alloc] initWithFrame:CGRectZero];
    onceUponATime.text = @"Once upon a time...";
    CGSize ouatSize = [onceUponATime.text sizeWithFont:onceUponATime.font];
    onceUponATime.frame = CGRectMake(20, 20, ouatSize.width, ouatSize.height);
    [self addSubview:onceUponATime];
    self.backgroundColor = [UIColor orangeColor];
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
