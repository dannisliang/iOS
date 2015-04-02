//
//  RACSubject+SendNil.h
//  Hackcancer
//
//  Created by James Campbell on 03/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

#import "RACSubject.h"

@implementation RACSubject (SendNil)

- (void)sendNil
{
    [self sendNext:nil];
}

@end
