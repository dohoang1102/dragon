//
//  PageElement+Extensions.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageElement+Extensions.h"
#import "SuperSerial.h"

@implementation PageElement (Extensions)

+ (id)pageElementFromAttributes:(NSDictionary *)attributes
{
  PageElement *pageElement = (PageElement *)[NSEntityDescription insertNewObjectForEntityForName:@"PageElement" inManagedObjectContext:appDelegate.managedObjectContext];
  pageElement.data = [NSKeyedArchiver archivedDataWithRootObject:attributes];
  return pageElement;
}

- (void)addToView:(UIView *)view
{
  NSDictionary *attributes = [NSKeyedUnarchiver unarchiveObjectWithData:self.data];

  NSString *type = [attributes objectForKey:@"type"];
  if ([@"text" isEqualToString:type]) {
    UILabel *label = [[self class] labelFromTextAttributes:attributes];
    [view addSubview:label];
  }
}

+ (UILabel *)labelFromTextAttributes:(NSDictionary *)attributes
{
  NSDictionary *deviceAttributes = [attributes objectForKey:[SuperSerial deviceJSONKey]];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = [attributes objectForKey:@"text"];
  
  UIFont *font = [UIFont systemFontOfSize:[[deviceAttributes objectForKey:@"size"] floatValue]];
  label.font = font;
  
  CGSize size = [label.text sizeWithFont:label.font];
  NSArray *position = [deviceAttributes objectForKey:@"position"];
  label.frame = CGRectMake([[position objectAtIndex:0] floatValue], [[position objectAtIndex:1] floatValue], size.width, size.height);
  
  return label;
}


@end
