//
//  SuperSerial.m
//  Dragon
//
//  Created by Ian Terrell on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SuperSerial.h"

@implementation SuperSerial

+ (NSString *)deviceJSONKey
{
  static NSString *deviceJSONKey;
  if (deviceJSONKey == nil)
    deviceJSONKey = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? @"iPad" : @"iPhone";
  return deviceJSONKey;
}

+ (id)JSONObjectFromFileNamed:(NSString *)fileName 
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  
  NSError *error;
  id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
  if (error) {
    DLog(@"Could not deserialize JSON data, error is %@", error);
    return nil;
    // TODO: Handle robustly
  } else {
    return jsonObject;
  }
}

@end
