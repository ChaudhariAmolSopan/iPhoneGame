//
//  UDUniversalCCLayer.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/27/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Box2D.h"
//#import "GLES-Render.h"
#import "LevelHelperLoader.h"
#import "AppDelegate.h"
#import "ContactListener.h"
#import "HealthBar.h"
#import "GameManager.h"
#import "ScoringSystem.h"
#import "UDEmitterMethods.h"

@interface UDUniversalCCLayer : CCLayer
{
    b2World *_world;
   // GLESDebugDraw *_debugDraw;
    LevelHelperLoader *_lhelper;
    b2Body *groundBody;
    LHSprite *_player;

    AppDelegate *appDelegate;

    HealthBar *healthBar;
    ScoringSystem *scoringSystem;
    
    UDEmitterMethods *emitterMethods;
    UDEmitterMethods *badBonusEmitterMethods;
    UDEmitterMethods *victoryMethods;
    
    CCLabelTTF *label;

}

-(void)setUpWorld;
-(void)createGround;
-(void)winLost;


-(id)initWithPlayerSpriteName:(NSString *)playerName stageFileName:(NSString*)stageFileName;
-(void)UDRevoluteJointsMethodsImplementation;
@end
