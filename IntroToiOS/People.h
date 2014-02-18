//
//  People.h
//  IntroToiOS
//
//  Created by Joseph McBride on 2/18/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface People : NSObject

- (Person *)loadPerson:(NSString *)jsonData;

@end
