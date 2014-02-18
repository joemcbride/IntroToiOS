//
//  IntroToiOSTestsKiwi.m
//  IntroToiOS
//
//  Created by Joseph McBride on 2/18/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(tests)

describe(@"Numbers", ^{
    it(@"1+1 should equal 2", ^{
        [[theValue(1+1) should] equal:theValue(2)];
    });
});

SPEC_END