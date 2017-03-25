//
//  EventDispatcher.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "EventDispatcher.h"

@interface EventDispatcher ()

@property (nonatomic, strong) NSMutableArray *receivers;

@end

@implementation EventDispatcher

+ (id)defaultDispatcher {
    static EventDispatcher *dispatcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatcher = [self new];
    });
    return dispatcher;
}

- (NSMutableArray *)receivers {
    if (!_receivers) {
        _receivers = [NSMutableArray array];
    }
    return _receivers;
}

- (void)addReceiver:(id<EventReceiverProtocol>)receiver {
    if (![self.receivers containsObject:receiver]) {
        [self.receivers addObject:receiver];
    }
}

- (void)removeReceiver:(id<EventReceiverProtocol>)receiver {
    if ([self.receivers containsObject:receiver]) {
        [self.receivers removeObject:receiver];
    }
}

- (void)dispatchEventWithName:(NSString *)eventName {
    [self dispatchEvent:[Event createEventWithName:eventName]];
}

- (void)dispatchEvent:(Event *)event {
    if (event) {
        for (id<EventReceiverProtocol> receiver in self.receivers) {
            if ([receiver canHandleEventWithName:event.name]) {
                [receiver receiveEvent:event];
            }
        }
    }
}

@end
