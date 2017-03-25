//
//  DefaultActionDispatcher.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionDispatcherProtocol.h"
#import "Action.h"

@interface ActionDispatcher : NSObject <ActionDispatcherProtocol>

+ (id)defaultDispatcher;
- (void)addReceiver:(id<ActionReceiverProtocol>)receiver;
- (void)removeReceiver:(id<ActionReceiverProtocol>)receiver;
- (void)dispatchActionWithName:(NSString *)actionName completionHandler:(id)completionHandler;
- (void)dispatchAction:(Action *)action;

@end
