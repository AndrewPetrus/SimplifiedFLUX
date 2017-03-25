//
//  EventDispatcher.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDispatcherProtocol.h"
#import "Event.h"

@interface EventDispatcher : NSObject <EventDispatcherProtocol>

+ (id)defaultDispatcher;

@end
