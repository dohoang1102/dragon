//
//  PageViewController.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageViewController.h"

NSString *deviceKey;

@interface PageViewController ()

@end

@implementation PageViewController

+ (void)initialize
{
  deviceKey = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? @"iPad" : @"iPhone";
}

- (id)initWithJSONInFileNamed:(NSString *)fileName
{
  self = [super init];
  if (self) {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    NSDictionary *pageData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
      DLog(@"Could not load page data, error is %@", error);
      // TODO: Handle robustly
    } else {
      [self loadFromData:pageData];
    }
  }
  return self;
}

- (void)loadFromData:(NSDictionary *)data {
  
  NSArray *elements = [data objectForKey:@"elements"];
  for (NSDictionary *element in elements) {
    NSString *type = [element objectForKey:@"type"];
    if ([@"text" isEqualToString:type]) {
      UILabel *label = [self labelFromTextAttributes:element];
      [self.view addSubview:label];
    }
  }
}

- (UILabel *)labelFromTextAttributes:(NSDictionary *)attributes
{
  NSDictionary *deviceAttributes = [attributes objectForKey:deviceKey];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = [attributes objectForKey:@"text"];
  
  UIFont *font = [UIFont systemFontOfSize:[[deviceAttributes objectForKey:@"size"] floatValue]];
  label.font = font;
  
  CGSize size = [label.text sizeWithFont:label.font];
  NSArray *position = [deviceAttributes objectForKey:@"position"];
  label.frame = CGRectMake([[position objectAtIndex:0] floatValue], [[position objectAtIndex:1] floatValue], size.width, size.height);
  
  return label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
