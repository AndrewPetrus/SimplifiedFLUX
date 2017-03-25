//
//  MyFirstActionReceiver.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "MyFirstActionReceiver.h"
#include "Actions.h"

@implementation MyFirstActionReceiver

- (BOOL)canHandleActionWithName:(NSString *)actionName {
    if ([actionName isEqualToString:someAction1] ||
        [actionName isEqualToString:someAction4]) {
        return YES;
    }
    return NO;
}

- (void)receiveAction:(Action *)action {
    if ([action.name isEqualToString:someAction1]) {
        [self handleSomeAction1:action.completionHandler];
    } else if ([action.name isEqualToString:someAction4]) {
        [self handleSomeAction4:action.completionHandler];
    }
}

#pragma mark - Actual action handler methods

- (void)handleSomeAction1:(CompletionHandler)completionHandler {
    NSLog(@"SomeAction1 handled!");
    completionHandler(nil, nil, self);
}

- (void)handleSomeAction4:(CompletionHandler)completionHandler {
    NSLog(@"SomeAction4 handled by MyFirstActionReceiver!");
    completionHandler(nil, nil, self);
}

@end
