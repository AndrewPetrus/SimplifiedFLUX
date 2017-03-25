//
//  Event.h
//  SimplifiedFLUX
//
//  Created by Andrew Petrus on 14.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id message;
@property (nonatomic, strong) id sender;

+ (instancetype)createEventWithName:(NSString *)name;

@end
