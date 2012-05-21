//
//  BackgroundLayer.m
//  SpaceViking
//
//  Created by Amol Chaudhari on 9/25/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        
   /*     CCSprite *backgroundImage;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) { //checks for ipad
            backgroundImage = [CCSprite spriteWithFile:@"TableTop.png"];
        }
        else
        {
            backgroundImage = [CCSprite spriteWithFile:@"TableTop.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
        [self addChild:backgroundImage z:0 tag:0];
        
        */
        
        
    }
    
    return self;
}

@end
