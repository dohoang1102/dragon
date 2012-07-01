//
//  PageElement+Extensions.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageElement.h"

@interface PageElement (Extensions)

+ (id)pageElementFromAttributes:(NSDictionary *)attributes;
- (void)addToView:(UIView *)view;

@end
