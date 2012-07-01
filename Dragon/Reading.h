//
//  Reading.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Decision, Story;

@interface Reading : NSManagedObject

@property (nonatomic, retain) Story *story;
@property (nonatomic, retain) NSSet *decisions;
@end

@interface Reading (CoreDataGeneratedAccessors)

- (void)addDecisionsObject:(Decision *)value;
- (void)removeDecisionsObject:(Decision *)value;
- (void)addDecisions:(NSSet *)values;
- (void)removeDecisions:(NSSet *)values;

@end
