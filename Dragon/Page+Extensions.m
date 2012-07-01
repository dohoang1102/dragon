//
//  Page+Extensions.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page+Extensions.h"
#import "PageElement+Extensions.h"

@implementation Page (Extensions)

+ (id)pageFromAttributes:(NSDictionary *)attributes
{
  Page *page = (Page *)[NSEntityDescription insertNewObjectForEntityForName:@"Page" inManagedObjectContext:appDelegate.managedObjectContext];
  page.tag = [attributes objectForKey:@"tag"];
  
  NSArray *pageElements = [attributes objectForKey:@"elements"];
  for (NSDictionary *elementAttributes in pageElements)
    [page addElementsObject:[PageElement pageElementFromAttributes:elementAttributes]];
  
  return page;
}

- (void)initializeView:(UIView *)view
{
  for (PageElement *element in self.elements)
    [element addToView:view];
}

@end
