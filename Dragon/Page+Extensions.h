//
//  Page+Extensions.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Page.h"

@interface Page (Extensions)

+ (id)pageFromAttributes:(NSDictionary *)attributes;
- (void)initializeView:(UIView *)view;

@end
