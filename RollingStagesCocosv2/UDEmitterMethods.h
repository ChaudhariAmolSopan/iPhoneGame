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

#import "ScoringSystem.h"
#import "GameManager.h"
@interface UDEmitterMethods : CCLayer
{
    CCParticleSystem *smokeEmitter;
    LevelHelper_TAG tagFromUser;
    ScoringSystem *scoringSystem;
    
}

@property (nonatomic,retain)    LevelHelperLoader *_lhelper;
@property (nonatomic,retain)   NSMutableDictionary *dictionaryForEmitters;
@property (nonatomic) LevelHelper_TAG tagFromUser;
@property (nonatomic,retain)  ScoringSystem *scoringSystem;



- (id)initWithLevelHelper:(LevelHelperLoader*)_lhelperFromUser LevelHelperTag:(LevelHelper_TAG)tag bonusPlistName:(NSString*)bonusPlistName andScoringSystem:(ScoringSystem *)scoringSystem;
-(void)detectCollisionWithSensors;

-(void)removeBodyCompletely:(LHSprite*)bodyTobeDestroyed emitterToBeRemoved:(CCParticleSystem *)emitter;


-(void)initEmitterWithBonusType:(NSString *)bonusPlistName;  //hide by making private
- (NSString*)formatTypeToString:(LevelHelper_TAG)formatType;
@end
