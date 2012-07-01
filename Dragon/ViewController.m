//
//  ViewController.m
//  Dragon
//
//  Created by Ian Terrell on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PageView.h"
#import "OnceUponATime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  self.view.backgroundColor = [UIColor grayColor];
  
  // applicationFrame is always portrait, we're running always landscape
  CGRect mainFrame = [UIScreen mainScreen].applicationFrame;
  mainFrame.size = CGSizeMake(mainFrame.size.height, mainFrame.size.width);
  PageView *pageView = [[PageView alloc] initWithFrame:mainFrame];
  
  [pageView addPage:[[OnceUponATime alloc] init]];
  [pageView addPage:[[OnceUponATime alloc] init]];
  [self.view addSubview:pageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
