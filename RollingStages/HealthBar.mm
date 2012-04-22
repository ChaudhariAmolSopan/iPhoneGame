//
//  HealthBar.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/12/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "HealthBar.h"

@implementation HealthBar

@synthesize healthHiderLayer,isDead;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self healthBar];
        
    }
    
    return self;
}


-(void)healthBar
{
    float healthWidth = 200;
    float healthHeight = 39;
    CCLayerGradient* baseHealthLayer = [CCLayerGradient layerWithColor:ccc4(255, 0, 0, 255)
                                                              fadingTo:ccc4(0, 255, 0, 255) alongVector:ccp(1.0f,0.0f)];
    baseHealthLayer.contentSize = CGSizeMake(healthWidth, healthHeight);
    [baseHealthLayer setPosition:CGPointMake(50, 50)];
    [baseHealthLayer setAnchorPoint:CGPointZero];
    [self addChild:baseHealthLayer];
    healthHiderLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 255) width:healthWidth
                                             height:healthHeight];
    healthHiderLayer.position = CGPointZero;;//ccp(shieldWidth,shieldHeight);
    healthHiderLayer.anchorPoint = ccp(1.0f,0.0f);
    [baseHealthLayer addChild:healthHiderLayer z:3];
    CCSprite* healthGrill = [CCSprite spriteWithFile:@"HealthBar.png"];
    healthGrill.position = CGPointZero;
    healthGrill.anchorPoint = CGPointZero;
    [baseHealthLayer addChild:healthGrill z:4];    
    isDead=NO;
    [self setHealthPercent:1.0f];
    
}




-(void)setHealthPercent:(float)pct
{
    healthHiderLayer.scaleX=1.0f - pct; //means 0
}

-(void)reduceHealthPercent:(float)pct
{
    if (healthHiderLayer.scaleX<1.0f) {
        healthHiderLayer.scaleX = healthHiderLayer.scaleX + 0.01f;
        
    }
    else if(healthHiderLayer.scaleX>=1.0f)
    {
        isDead=YES;
    }
}

-(void)reduceHealthHandler:(LHSprite *)_player

{
    

 
        //if (!hasWon) {
        b2ContactEdge *edge = _player.body->GetContactList();
        while (edge) {
            b2Contact *contact = edge->contact;
            b2Fixture *fixtureA = contact->GetFixtureA();
            b2Fixture *fixtureB=contact->GetFixtureB();
            
            b2Body *bodyA = fixtureA->GetBody();
            b2Body *bodyB = fixtureB->GetBody();
            
        //    NSLog(@"Debug for health");
            
            [self reduceHealthPercent:0.01f];

         /*   if ((bodyA == _bonusSensor.body)||(bodyB == _bonusSensor.body)) {
                // hasWon = true;
                //[self win];
                [self removeBodyCompletely:_bonusSensor];
                
                //  [emitter removeFromParentAndCleanup:YES];
                [_bonusSensor removeFromParentAndCleanup:YES];
                NSLog(@"I m in contact list");
                
                break;
            }
            */
            edge = edge->next;
            
        }
        // }
     
    
    
}



@end
