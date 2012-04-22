//
//  MainMenuScene.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/11/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "MainMenuScene.h"

@implementation MainMenuScene

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        mainMenuLayer = [MainMenuLayer node];
        [self addChild:mainMenuLayer];
        
    }
    
    return self;
}

@end
