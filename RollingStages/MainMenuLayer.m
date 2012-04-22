//
//  MainMenuLayer.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/11/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "MainMenuLayer.h"
#import "GameManager.h"
@implementation MainMenuLayer



-(void)playScene:(CCMenuItemFont*)itemPassedIn
{
    
    /*
     The playScene method launches the GameplayScene depending on which of the  levels the player has selected
     */
    if (itemPassedIn.tag==1) {
        CCLOG(@"Play game scene selected from Main Menu");
        [[GameManager sharedGameManager]runSceneWithID:kGameLevel1];
    }
    else if(itemPassedIn.tag==2)
    {
        CCLOG(@"Play game scene selected from Main Menu");
        [[GameManager sharedGameManager]runSceneWithID:kOptionsScene];
    }
    
    
    
    
}

-(void)displayMainMenu
{
    /*
     
  Using fontfile to display 
     
     */
    
    CGSize screenSize = [CCDirector sharedDirector].winSize; 

    
    CCLabelBMFont *playGameButtonLabel = [CCLabelBMFont labelWithString:@"Play" fntFile:@"RollingStagesfnt.fnt"];
    CCMenuItemLabel *playGameButton = [CCMenuItemLabel itemWithLabel:playGameButtonLabel target:self selector:@selector(playScene:)];
    [playGameButton setTag:1];
    
    //Options start
    
    CCLabelBMFont *optionsGameButtonLabel = [CCLabelBMFont labelWithString:@"Options" fntFile:@"RollingStagesfnt.fnt"];
    CCMenuItemLabel *optionsGameButton = [CCMenuItemLabel itemWithLabel:optionsGameButtonLabel target:self selector:@selector(playScene:)];
    [optionsGameButton setTag:2];
    

    
    //end
    
    

    
    CCMenu *mainMenu = [CCMenu menuWithItems:playGameButton,optionsGameButton, nil];
    [mainMenu alignItemsVerticallyWithPadding:60.0f];
    [mainMenu setPosition:ccp(screenSize.width * 0.75f, screenSize.height/2)];
    [self addChild:mainMenu];
    
}



- (void)setBackground {
        // Initialization code here.
        
        
          CGSize screenSize = [CCDirector sharedDirector].winSize;
     
        
        CCSprite *background = [CCSprite spriteWithFile:@""];
        [background setPosition:ccp(screenSize.width/2,screenSize.height/2)];
        [self addChild:background];

}



- (id)init
{
    self = [super init];
    if (self) {
        
        
       // [self setBackground];  //to set background
        [self displayMainMenu];
        
        
        
        
        
        
        
        
        
    }
    
    return self;
}



@end
