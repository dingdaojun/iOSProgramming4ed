//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by John Gallagher on 1/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
