//
//  ActionReceiverProtocol.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Definitions.h"
#import "Action.h"

@protocol ActionReceiverProtocol <NSObject>

- (BOOL)canHandleActionWithName:(NSString *)actionName;
- (void)receiveAction:(Action *)action;

@end
