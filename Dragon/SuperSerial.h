//
//  SuperSerial.h
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperSerial : NSObject

+ (NSString *)deviceJSONKey;
+ (id)JSONObjectFromFileNamed:(NSString *)fileName;

@end
