//
//  Story+Extensions.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Story+Extensions.h"
#import "Page+Extensions.h"
#import "SuperSerial.h"

@implementation Story (Extensions)

+ (NSNumber *)currentBuildNumberFromFile
{
  static NSNumber *currentBuildNumber;
  if (currentBuildNumber == nil) {
    NSDictionary *buildData = [SuperSerial JSONObjectFromFileNamed:@"build"];
    currentBuildNumber = [buildData objectForKey:@"number"];
  }
  return currentBuildNumber;
}

+ (Story *)defaultStory
{
  NSFetchRequest *storyRequest = [[NSFetchRequest alloc] init];
  storyRequest.entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:appDelegate.managedObjectContext];
  NSArray *stories = [appDelegate.managedObjectContext executeFetchRequest:storyRequest error:nil];
  return ([stories count] == 0) ? nil : [stories objectAtIndex:0];
}

- (BOOL)isUpToDate
{
 return [[[self class] currentBuildNumberFromFile] isEqualToNumber:self.buildNumber];
}

+ (Story *)reloadData
{
  if ([self defaultStory])
    [appDelegate.managedObjectContext deleteObject:[self defaultStory]];
  return [self loadData];
}

+ (Story *)loadData
{
  Story *story = (Story *)[NSEntityDescription insertNewObjectForEntityForName:@"Story" inManagedObjectContext:appDelegate.managedObjectContext];
  story.buildNumber = [[self class] currentBuildNumberFromFile];
  
  NSDictionary *storyData = [SuperSerial JSONObjectFromFileNamed:@"story"];
  NSArray *pages = [storyData objectForKey:@"pages"];
  for (NSDictionary *pageAttributes in pages)
    [story addPagesObject:[Page pageFromAttributes:pageAttributes]];
  
  [appDelegate saveContext];
  return story;
}

@end
