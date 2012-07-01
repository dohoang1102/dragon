//
//  Decision.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reading;

@interface Decision : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) Reading *reading;

@end
