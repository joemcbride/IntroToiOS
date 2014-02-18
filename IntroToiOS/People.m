//
//  People.m
//  IntroToiOS
//
//  Created by Joseph McBride on 2/18/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "People.h"

@implementation People

- (Person *)loadPerson:(NSString *)jsonData {
    
    NSError *error;
    
    NSData *data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(error) {
        NSLog(@"Error parsing json:\n%@", [error description]);
        return nil;
    }
    
    Person *person = [Person new];
    person.firstName = dict[@"FirstName"];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *setKey = [NSString stringWithFormat:@"set%@:", key];
        // setFirstName:
        if(value && ![value isKindOfClass:[NSDictionary class]] && [person respondsToSelector:NSSelectorFromString(setKey)]) {
            NSLog(@"setKey: %@", setKey);
            [person setValue:value forKey:key];
        }
    }];
    
    NSMutableDictionary *jsonAddress = dict[@"Address"];
    if(jsonAddress) {
        Address *address = [Address new];
        address.line1 = jsonAddress[@"Line1"];
        address.city = jsonAddress[@"City"];
        address.state = jsonAddress[@"State"];
        address.zip = jsonAddress[@"Zip"];
        
        person.address = address;
    }

    return person;
}

@end
