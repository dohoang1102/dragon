//
//  ViewController.m
//  Dragon
//
//  Created by Ian Terrell on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ContentController.h"
#import "PageViewController.h"
#import "Story+Extensions.h"
#import "Page+Extensions.h"

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
  ContentController *pageView = [[ContentController alloc] initWithViewFrame:mainFrame];
  
  Story *story = [Story defaultStory];
  for (Page *page in story.pages) {
    [pageView addPage:[[PageViewController alloc] initWithPage:page]];
  }
  [self.view addSubview:pageView.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
 
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
