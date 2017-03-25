//
//  Event.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "Event.h"

@implementation Event

+ (instancetype)createEventWithName:(NSString *)name {
    Event *event = [Event new];
    if (event) {
        event.name = name;
        event.date = [NSDate date];
    }
    return event;
}

@end
