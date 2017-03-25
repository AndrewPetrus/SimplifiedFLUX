//
//  EventReceiverProtocol.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@protocol EventReceiverProtocol <NSObject>

- (BOOL)canHandleEventWithName:(NSString *)eventName;
- (void)receiveEvent:(Event *)event;

@end
