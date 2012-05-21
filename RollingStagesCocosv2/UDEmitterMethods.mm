//
//  UDEmitterMethods.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/20/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "UDEmitterMethods.h"

@implementation UDEmitterMethods
@synthesize  _lhelper,dictionaryForEmitters,tagFromUser,scoringSystem;

- (id)initWithLevelHelper:(LevelHelperLoader*)_lhelperFromUser LevelHelperTag:(LevelHelper_TAG)tag bonusPlistName:(NSString*)bonusPlistName andScoringSystem:(ScoringSystem *)scoringSystem
{
    self = [super init];
    if (self) {
        // Initialization code here.
        _lhelper = _lhelperFromUser;
        
        self.tagFromUser = tag;
        self.scoringSystem = scoringSystem;
        
        [self initEmitterWithBonusType:bonusPlistName];
    }
    
    return self;
}


-(void)initEmitterWithBonusType:(NSString *)bonusPlistName
{
//Particle System Check
NSArray *arrayForSensors = [_lhelper spritesWithTag:tagFromUser];

NSLog(@"The arrayForSensors.count is %d",arrayForSensors.count);

dictionaryForEmitters = [[NSMutableDictionary alloc] init];

for (int i=0; i<arrayForSensors.count; i++) {
    
    
    CCParticleSystem *emitter2=[ARCH_OPTIMAL_PARTICLE_SYSTEM particleWithFile:bonusPlistName];
    // [self addChild:emitter2];
    //Particles System Start
    CGPoint newPosition= [[arrayForSensors objectAtIndex:i] position] ;
    
    
    //  [dictionaryForEmitters setValue:emitter2 forKey:[arrayForSensors objectAtIndex:i]];
    
    NSString *uniqueNameForSensors = [[arrayForSensors objectAtIndex:i]uniqueName];
    
    [dictionaryForEmitters setObject:emitter2 forKey:uniqueNameForSensors];
    
    //   [dictionaryForEmitters objectForKey:[[[arrayForSensors objectAtIndex:i]uniqueName] setPosition:newPosition]];
    [emitter2 setPosition:newPosition];
    [self addChild:emitter2];
    
    
    
}
}



-(void)detectCollisionWithSensors
{
    //if (!hasWon) {
    LHSprite *_player = [_lhelper spriteWithUniqueName:@"skull"];
    NSAssert(_player != nil, @"Couldnt find player");
    
    b2ContactEdge *edge = _player.body->GetContactList();
    while (edge) {
        b2Contact *contact = edge->contact;
        b2Fixture *fixtureA = contact->GetFixtureA();
        b2Fixture *fixtureB=contact->GetFixtureB();
        
        b2Body *bodyA = fixtureA->GetBody();
        b2Body *bodyB = fixtureB->GetBody();
        
        //  NSLog(@"Debug for health");
        
        NSArray *arrayForSensors = [_lhelper spritesWithTag:tagFromUser];
        
        
        NSString *formattedType = [self formatTypeToString:tagFromUser];

        for (int i=0; i<arrayForSensors.count; i++) {
            
            if ((bodyA == [[arrayForSensors objectAtIndex:i] body])||(bodyB == [[arrayForSensors objectAtIndex:i] body])) {
                
                if (formattedType == @"VICTORY")
                {
                    NSLog(@"Something like %@ " , formattedType);
//                    [[GameManager sharedGameManager] runSceneWithID:(SceneTypes)kMainMenuScene];

                    if ( [[_lhelper spritesWithTag:WHITEGOODBONUS] count] == 0) {
                        [[GameManager sharedGameManager] setHasPlayerWon:YES];
                    }
                }
                else {
                    NSLog(@"Something like %@ " , formattedType);
                    NSString *uniqueName = [[arrayForSensors objectAtIndex:i]uniqueName];
                    CCParticleSystem *emitter = [dictionaryForEmitters objectForKey:uniqueName];
                    [self removeBodyCompletely:[arrayForSensors objectAtIndex:i] emitterToBeRemoved:emitter];
                    
                    [_lhelper removeSprite:[arrayForSensors objectAtIndex:i]];
                    NSLog(@"I m in contact list");
                    
                    [scoringSystem updateScore:[self formatTypeToString:tagFromUser]];
                }
                
                


                break;
            }
            
            
        }
        
        
        edge = edge->next;
        
    }
    
}

-(void)removeBodyCompletely:(LHSprite*)bodyTobeDestroyed emitterToBeRemoved:(CCParticleSystem *)emitter
{
    
    
    CCScaleTo *growAction = [CCScaleTo actionWithDuration:0.1 scale:10.0];
    CCScaleTo *shrinkAction = [CCScaleTo actionWithDuration:0.1 scale:0.1];
    
    CCCallFuncO *doneAction = [CCCallFuncO actionWithTarget:self selector:@selector(shrinkDone:) object:emitter];
    
    
    CCSequence *sequence = [CCSequence actions:growAction,shrinkAction,doneAction, nil];
    [emitter runAction:sequence];
    
    //  _world->DestroyBody(bodyTobeDestroyed.body);
    
    // bodyTobeDestroyed=NULL;
    
    // [bodyTobeDestroyed removeFromParentAndCleanup:YES];
}

-(void)shrinkDone:(id)sender
{
    NSLog(@"in ShrinkDone method %@",[sender description]);
    [sender stopSystem];
    [sender removeFromParentAndCleanup:YES];
    
    
}

-(void)smokeEmitter
{
    smokeEmitter = [CCParticleSmoke node];
    
    
    
    
      [self addChild:smokeEmitter];

}


- (NSString*)formatTypeToString:(LevelHelper_TAG)formatType {
    NSString *result = nil;
    
    switch(formatType) {
        case REDBADBONUS:
            result = @"REDBADBONUS";
            break;
        case WHITEGOODBONUS:
            result = @"WHITEGOODBONUS";
            break;
        case VICTORY:
            result = @"VICTORY";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}


@end
