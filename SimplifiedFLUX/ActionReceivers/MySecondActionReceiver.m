//
//  MySecondActionReceiver.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "MySecondActionReceiver.h"
#include "Actions.h"

@implementation MySecondActionReceiver

- (BOOL)canHandleActionWithName:(NSString *)actionName {
    if ([actionName isEqualToString:someAction2] ||
        [actionName isEqualToString:someAction3] ||
        [actionName isEqualToString:someAction4]) {
        return YES;
    }
    return NO;
}

- (void)receiveAction:(Action *)action {
    if ([action.name isEqualToString:someAction2]) {
        [self handleSomeAction2:action.completionHandler];
    } else if ([action.name isEqualToString:someAction3]) {
        [self handleSomeAction3:action.completionHandler];
    } else if ([action.name isEqualToString:someAction4]) {
        [self handleSomeAction4:action.completionHandler];
    }
}

#pragma mark - Actual action handler methods

- (void)handleSomeAction2:(CompletionHandler)completionHandler {
    NSLog(@"SomeAction2 handled!");
    completionHandler(nil, nil, self);
}

- (void)handleSomeAction3:(CompletionHandler)completionHandler {
    NSLog(@"SomeAction3 handled!");
    completionHandler(nil, nil, self);
}

- (void)handleSomeAction4:(CompletionHandler)completionHandler {
    NSLog(@"SomeAction4 handled by MySecondActionReceiver!");
    completionHandler(nil, nil, self);
}

@end
