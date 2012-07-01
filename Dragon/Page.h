//
//  Page.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PageElement, Story;

@interface Page : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) Story *story;
@property (nonatomic, retain) NSSet *elements;
@end

@interface Page (CoreDataGeneratedAccessors)

- (void)addElementsObject:(PageElement *)value;
- (void)removeElementsObject:(PageElement *)value;
- (void)addElements:(NSSet *)values;
- (void)removeElements:(NSSet *)values;

@end
