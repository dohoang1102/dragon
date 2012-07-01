//
//  Story.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Page, Reading;

@interface Story : NSManagedObject

@property (nonatomic, retain) NSNumber * buildNumber;
@property (nonatomic, retain) NSSet *pages;
@property (nonatomic, retain) NSSet *readings;
@end

@interface Story (CoreDataGeneratedAccessors)

- (void)addPagesObject:(Page *)value;
- (void)removePagesObject:(Page *)value;
- (void)addPages:(NSSet *)values;
- (void)removePages:(NSSet *)values;

- (void)addReadingsObject:(Reading *)value;
- (void)removeReadingsObject:(Reading *)value;
- (void)addReadings:(NSSet *)values;
- (void)removeReadings:(NSSet *)values;

@end
