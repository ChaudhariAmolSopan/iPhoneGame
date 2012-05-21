//
//  GameScene.m
//  SpaceViking
//
//  Created by Amol Chaudhari on 10/29/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        
  //      BackgroundLayer *backgroundLayer = [BackgroundLayer node];
    //    [self addChild:backgroundLayer z:0];
        ActionLayer *gameplayLayer = [ActionLayer node];
        [self addChild:gameplayLayer z:5];
        
        
        
        
    }
    
    return self;
}




@end
