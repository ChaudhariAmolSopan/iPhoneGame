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
    CGSize screenSize = [CCDirector sharedDirector].winSize; 
    
    
    
    CCSprite* healthGrill = [CCSprite spriteWithFile:@"HealthBar.png"];
    healthGrill.position = CGPointZero;
    healthGrill.anchorPoint = CGPointZero;
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        
        [healthGrill setScaleX:screenSize.width/1024.0f];
        [healthGrill setScaleY:screenSize.height/768.0f];
        
        NSLog(@"the x coord is %f",healthGrill.scaleX);
        NSLog(@"the y coord is %f",healthGrill.scaleY);
    }
    
    
    float healthWidth = healthGrill.scaleX*200.0f;
    float healthHeight = healthGrill.scaleY*40.0f;
    CCLayerGradient* baseHealthLayer = [CCLayerGradient layerWithColor:ccc4(255, 0, 0, 255)
                                                              fadingTo:ccc4(0, 255, 0, 255) alongVector:ccp(1.0f,0.0f)];
    baseHealthLayer.contentSize = CGSizeMake(healthWidth, healthHeight);
    [baseHealthLayer setPosition:CGPointMake(screenSize.width/2 +50.0f, screenSize.height-20)];//change to move the complete health bar
    
    
    
    [baseHealthLayer setAnchorPoint:CGPointZero];
    [self addChild:baseHealthLayer];
    healthHiderLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 255) width:healthWidth
                                             height:healthHeight];
    healthHiderLayer.position = CGPointZero;;//ccp(shieldWidth,shieldHeight);
    healthHiderLayer.anchorPoint = ccp(1.0f,0.0f);
    [baseHealthLayer addChild:healthHiderLayer z:3];
    
    
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
        healthHiderLayer.scaleX = healthHiderLayer.scaleX + pct;
        
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
            
            [self reduceHealthPercent:0.001f];

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
