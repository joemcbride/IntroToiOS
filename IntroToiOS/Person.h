//
//  Person.h
//  IntroToiOS
//
//  Created by Joseph McBride on 2/18/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface Person : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) Address *address;

@end
