//
//  ActionDispatcherProtocol.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionReceiverProtocol.h"
#include "Definitions.h"

@class Action;
@protocol ActionDispatcherProtocol <NSObject>

- (void)addReceiver:(id<ActionReceiverProtocol>)receiver;
- (void)removeReceiver:(id<ActionReceiverProtocol>)receiver;
- (void)dispatchActionWithName:(NSString *)actionName completionHandler:(CompletionHandler)completionHandler;
- (void)dispatchAction:(Action *)action;

@end
