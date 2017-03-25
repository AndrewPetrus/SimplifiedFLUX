//
//  EventDispatcherProtocol.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Definitions.h"
#import "EventReceiverProtocol.h"

@class Event;
@protocol EventDispatcherProtocol <NSObject>

- (void)addReceiver:(id<EventReceiverProtocol>)receiver;
- (void)removeReceiver:(id<EventReceiverProtocol>)receiver;
- (void)dispatchEventWithName:(NSString *)eventName;
- (void)dispatchEvent:(Event *)event;

@end
