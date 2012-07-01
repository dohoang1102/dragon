//
//  Story+Extensions.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Story.h"

@interface Story (Extensions)

+ (Story *)defaultStory;

- (BOOL)isUpToDate;

+ (Story *)reloadData;
+ (Story *)loadData;


@end
