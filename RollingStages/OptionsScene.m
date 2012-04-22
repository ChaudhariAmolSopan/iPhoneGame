//
//  OptionsScene.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/25/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "OptionsScene.h"

@implementation OptionsScene

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        optionsLayer = [OptionsLayer node];
        [self addChild:optionsLayer];

    }
    
    return self;
}

@end
