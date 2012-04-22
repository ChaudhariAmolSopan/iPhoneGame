//
//  UDEmitterMethods.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/20/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "CCLayer.h"
#import "LevelHelperLoader.h"
#import "Box2D.h"

@interface UDEmitterMethods : CCLayer
{
    CCParticleSystem *smokeEmitter;
    LevelHelper_TAG tagFromUser;
    
}

@property (nonatomic,retain)    LevelHelperLoader *_lhelper;
@property (nonatomic,retain)   NSMutableDictionary *dictionaryForEmitters;
@property (nonatomic) LevelHelper_TAG tagFromUser;

- (id)initWithLevelHelper:(LevelHelperLoader*)_lhelperFromUser andLevelHelperTag:(LevelHelper_TAG)tag;
-(void)detectCollisionWithSensors;




-(void)initEmitter;  //hide by making private

@end
