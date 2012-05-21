//
//  LevelSelectLayer.m
//  RollingStages
//
//  Created by Amol Chaudhari on 5/15/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import "LevelSelectLayer.h"

@implementation LevelSelectLayer


-(void)addButtonsOnTheScreen
{
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    // Create a label for display purposes
      
    _label = [[CCLabelTTF labelWithString:@"Level Select" fontName:@"Arial" fontSize:32.0] retain];
    _label.position = ccp(winSize.width/2, 
                          winSize.height-(_label.contentSize.height/2));
    [self addChild:_label];
    
    NSArray *spritesArr = [_lhelper spritesWithTag:(LevelHelper_TAG) LEVELSELECT];
    for (int level_num = 0; level_num < [spritesArr count]; level_num++)
    {
        // Standard method to create a button
        NSString* level_img = [NSString stringWithFormat:@"Button%d.png", level_num];
        CCMenuItem *starMenuItem = [CCMenuItemImage 
                                    itemWithNormalImage:level_img selectedImage:level_img 
                                    target:self selector:@selector(starButtonTapped:)];
        [starMenuItem setTag:level_num];
        
        starMenuItem.position =  [[_lhelper spriteWithUniqueName:[NSString stringWithFormat:@"%d", level_num]] position];
//        starMenuItem.position = [spritesArr[level_num] position];

        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
    }

    


    
}

- (void)starButtonTapped:(id)sender  {
    
    //[_label setString:@"Last button: *"];
//    NSLog(sender);
    SceneTypes gotoScene;
    if ([sender tag] == 0)
    {
        gotoScene = kGameLevel4;
    }
    else {
        gotoScene = kMainMenuScene;
    }
    [[GameManager sharedGameManager]runSceneWithID:gotoScene];

    
    
}

- (id)init
{
    if (self=[super init]) {
        // Initialization code here.
        
       // [self schedule: @selector(tick:) interval:1.0f/60.0f];

        _lhelper = [[LevelHelperLoader alloc]initWithContentOfFile:@"LevelSelect"];
        b2World *_world;
        _world = new b2World(b2Vec2(0, 0)); 

        [_lhelper addObjectsToWorld:_world cocos2dLayer:self];
      //  [_lhelper addSpritesToLayer:self];
        
        
        [self addButtonsOnTheScreen];
        
        
        
    }
    
    return self;
}

+(id)scene
{
    CCScene *scene = [CCScene node];
    
    LevelSelectLayer *layer = [LevelSelectLayer node];
    [scene addChild:layer];
    
    return scene;
}







@end
