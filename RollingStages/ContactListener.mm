//
//  ContactListener.m
//  RollingStages
//
//  Created by Amol Chaudhari on 12/20/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//


#import "ContactListener.h"
#import "Box2D.h"
#import "b2Contact.h"
#import "cocos2d.h"
#import "AppDelegate.h"

// Implement contact listener.
ContactListener::ContactListener(){
    
};

void ContactListener::BeginContact(b2Contact* contact)
{
	b2Fixture* fixtureA = contact->GetFixtureA();
	CCSprite* actorA = (CCSprite*) fixtureA->GetBody()->GetUserData();
    
	b2Fixture* fixtureB = contact->GetFixtureB();
	CCSprite* actorB = (CCSprite*)  fixtureB->GetBody()->GetUserData();
    
  //  NSLog(@"Inside contact listener Debugging");
	// Return world box touch
	if(actorA == nil || actorB == nil) return;
    
    // For debug - randomly scale the objects so u can tell which were hit
	//[actorA setScale:CCRANDOM_0_1() + 0.5];
	//[actorB setScale:CCRANDOM_0_1() + 0.5];
    
    if (actorB.tag ==1 || actorA.tag==1) { //to get player contact
     //   NSLog(@"In side contact listener");
        AppDelegate *appDelegate = 	 (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.hasPlayerMadeContact =YES;
        appDelegate.detectCollisionToReduceHealth=YES;
        

    }
    

}

// Implement contact listener.
void ContactListener::EndContact(b2Contact* contact)
{
    b2Fixture* fixtureA = contact->GetFixtureA();
    CCSprite* actorA = (CCSprite*) fixtureA->GetBody()->GetUserData();
    
    b2Fixture* fixtureB = contact->GetFixtureB();
    CCSprite* actorB = (CCSprite*)  fixtureB->GetBody()->GetUserData();
    
    
    
    if(actorA == nil || actorB == nil) return;
}





