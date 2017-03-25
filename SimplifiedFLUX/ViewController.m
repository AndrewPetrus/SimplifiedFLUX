//
//  ViewController.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "ViewController.h"
#import "ActionDispatcher.h"
#import "MyFirstActionReceiver.h"
#import "MySecondActionReceiver.h"
#include "Actions.h"

#import "EventReceiverProtocol.h"
#import "EventDispatcher.h"

@interface ViewController () <EventReceiverProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EventDispatcher *defaultDispatcher = [EventDispatcher defaultDispatcher];
    [defaultDispatcher addReceiver:self];
    
    MyFirstActionReceiver *firstReceiver = [MyFirstActionReceiver new];
    MySecondActionReceiver *secondReceiver = [MySecondActionReceiver new];
    [[ActionDispatcher defaultDispatcher] addReceiver:firstReceiver];
    [[ActionDispatcher defaultDispatcher] addReceiver:secondReceiver];
    
    [self dispatchAction3];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    EventDispatcher *defaultDispatcher = [EventDispatcher defaultDispatcher];
    [defaultDispatcher removeReceiver:self];
}

- (void)dispatchAction1 {
    [[ActionDispatcher defaultDispatcher] dispatchActionWithName:someAction1
                                               completionHandler:^(NSError *error, id result, id executor) {
                                                   NSLog(@"OK, got result for someAction1");
                                               }];
}

- (void)dispatchAction2 {
    [[ActionDispatcher defaultDispatcher] dispatchActionWithName:someAction2
                                               completionHandler:^(NSError *error, id result, id executor) {
                                                   NSLog(@"OK, got result for someAction2");
                                               }];
}

- (void)dispatchAction3 {
    [[ActionDispatcher defaultDispatcher] dispatchActionWithName:someAction3
                                               completionHandler:^(NSError *error, id result, id executor) {
                                                   NSLog(@"OK, got result for someAction3");
                                                   [[EventDispatcher defaultDispatcher] dispatchEvent:[Event createEventWithName:@"event1"]];
                                               }];
}

- (void)dispatchAction4 {
    [[ActionDispatcher defaultDispatcher] dispatchActionWithName:someAction4
                                               completionHandler:^(NSError *error, id result, id executor) {
                                                   NSLog(@"OK, got result for someAction4");
                                               }];
}

#pragma mark - Event receiver

- (BOOL)canHandleEventWithName:(NSString *)eventName {
    if ([eventName isEqualToString:@"event1"]) {
        return YES;
    }
    return NO;
}

- (void)receiveEvent:(Event *)event {
    if ([event.name isEqualToString:@"event1"]) {
        NSLog(@"Received event1");
    }
}

@end
