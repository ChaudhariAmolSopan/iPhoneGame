//
//  ActionLayer.h
//  Raycast
//
//  Created by Amol Chaudhari on 12/17/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Box2D.h"
#import "GLES-Render.h"
#import "LevelHelperLoader.h"

#import "AppDelegate.h"
#import "HealthBar.h"
//@class GLESDebugDraw;

#import "UDEmitterMethods.h"

@interface ActionLayer : CCLayer
{
    
    b2World *_world;
    GLESDebugDraw *_debugDraw;
    LevelHelperLoader *_lhelper;
    b2Body *groundBody;

    LHSprite *_player;
    b2Body *_playerBody;
    
    BOOL isContactMade;
    
    AppDelegate *appDelegate;
    
    //Testing for Particles
    //CCParticleSystem *emitter;
  //  NSArray *arrayForSensors;
    NSMutableDictionary *dictionaryForEmitters;
    UDEmitterMethods *emitterMethods;
    
    //For Health bar
    HealthBar *healthBar ;   
}

//@property(nonatomic,retain) NSArray *arrayForSensors;
@property(nonatomic,retain) NSMutableDictionary *dictionaryForEmitters;


+(id)scene;
-(void)setUpWorld;
-(void)setUpLevelHelper;
-(void)createGround;

-(void)removeBodyCompletely:(LHSprite*)bodyTobeDestroyed emitterToBeRemoved:(CCParticleSystem *)emitter;
//-(void)detectCollisionWithSensors;
-(void)shrinkDone:(id)sender;


@end
