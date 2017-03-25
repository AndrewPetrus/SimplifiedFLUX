//
//  Action.m
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "Action.h"

@implementation Action

+ (instancetype)createActionWithName:(NSString *)name
                          parameters:(id)parameters
                              sender:(id)sender
                   completionHandler:(CompletionHandler)completionHandler {
    Action *action = [Action new];
    if (action) {
        action.name = name;
        action.parameters = parameters;
        action.sender = sender;
        action.completionHandler = completionHandler;
    }
    return action;
}

@end
