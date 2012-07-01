//
//  PageElement.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Page;

@interface PageElement : NSManagedObject

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) Page *page;

@end
