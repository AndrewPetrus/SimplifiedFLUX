//
//  DefaultActionDispatcher.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "ActionDispatcher.h"

@interface ActionDispatcher ()

@property (nonatomic, strong) NSMutableArray *receivers;

@end

@implementation ActionDispatcher

+ (id)defaultDispatcher {
    static ActionDispatcher *dispatcher = nil;
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

- (void)addReceiver:(id<ActionReceiverProtocol>)receiver {
    if (![self.receivers containsObject:receiver]) {
        [self.receivers addObject:receiver];
    }
}

- (void)removeReceiver:(id<ActionReceiverProtocol>)receiver {
    if ([self.receivers containsObject:receiver]) {
        [self.receivers removeObject:receiver];
    }
}

- (void)dispatchActionWithName:(NSString *)actionName completionHandler:(id)completionHandler {
    [self dispatchAction:[Action createActionWithName:actionName
                                           parameters:nil
                                               sender:self
                                    completionHandler:completionHandler]];
}

- (void)dispatchAction:(Action *)action {
    if (action) {
        for (id<ActionReceiverProtocol> receiver in self.receivers) {
            if ([receiver canHandleActionWithName:action.name]) {
                [receiver receiveAction:action];
            }
        }
    }
}

@end
