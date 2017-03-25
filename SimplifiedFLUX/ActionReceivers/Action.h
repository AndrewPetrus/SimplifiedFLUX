//
//  Action.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Definitions.h"

@interface Action : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id parameters;
@property (nonatomic, weak) id sender;
@property (nonatomic) CompletionHandler completionHandler;

+ (instancetype)createActionWithName:(NSString *)name
                          parameters:(id)parameters
                              sender:(id)sender
                   completionHandler:(CompletionHandler)completionHandler;

@end
