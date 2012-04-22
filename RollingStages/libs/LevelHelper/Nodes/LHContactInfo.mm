//  This file was generated by LevelHelper
//  http://www.levelhelper.org
//
//  LevelHelperLoader.mm
//  Created by Bogdan Vladu
//  Copyright 2011 Bogdan Vladu. All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//  The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//  Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//  This notice may not be removed or altered from any source distribution.
//  By "software" the author refers to this code file and not the application 
//  that was used to generate this file.
//
////////////////////////////////////////////////////////////////////////////////
#import "LHContactInfo.h"
#import "LevelHelperLoader.h"
#import "LHSettings.h"
////////////////////////////////////////////////////////////////////////////////
@interface LHContactInfo (Private)

@end
////////////////////////////////////////////////////////////////////////////////
@implementation LHContactInfo

////////////////////////////////////////////////////////////////////////////////
-(void) dealloc{	
#ifndef LH_ARC_ENABLED
	[super dealloc];
#endif
}
////////////////////////////////////////////////////////////////////////////////
-(id) initWithInfo:(b2Body*)_bodyA 
             bodyB:(b2Body*)_bodyB
           contact:(b2Contact*)_contact
       contactType:(int)type
          manifold:(const b2Manifold*)_manifold
           impulse:(const b2ContactImpulse*)_impulse

{
	self = [super init];
	if (self != nil)
	{
        bodyA = _bodyA;
        bodyB = _bodyB;
        contact = _contact;
        contactType = type;
        oldManifold = _manifold;
        impulse = _impulse;
	}
	return self;
}
////////////////////////////////////////////////////////////////////////////////
+(id) contactInfoWithBodyA:(b2Body*)bodyA 
                     bodyB:(b2Body*)bodyB
                   contact:(b2Contact*)_contact
               contactType:(int)type
                  manifold:(const b2Manifold*)_manifold
                   impulse:(const b2ContactImpulse*)_impulse
{
#ifndef LH_ARC_ENABLED
	return [[[LHContactInfo alloc] initWithInfo:bodyA 
                                          bodyB:bodyB
                                        contact:_contact
                                    contactType:type
                                       manifold:_manifold 
                                        impulse:_impulse] autorelease];
#else
    return [[LHContactInfo alloc] initWithInfo:bodyA 
                                          bodyB:bodyB
                                        contact:_contact
                                    contactType:type
                                       manifold:_manifold 
                                        impulse:_impulse];
#endif
}
////////////////////////////////////////////////////////////////////////////////
-(b2Body*)bodyA{
    return bodyA;
}
////////////////////////////////////////////////////////////////////////////////
-(b2Body*)bodyB{
    return bodyB;
}
////////////////////////////////////////////////////////////////////////////////
-(LH_CONTACT_TYPE) contactType{
    return (LH_CONTACT_TYPE)contactType;
}
////////////////////////////////////////////////////////////////////////////////
-(LHSprite*)spriteA{
#ifndef LH_ARC_ENABLED
    id spr = (id)bodyA->GetUserData();
#else
    id spr = (__bridge id)bodyA->GetUserData();
#endif
    if(nil != spr)
    {
        if([LHSprite isLHSprite:spr])
        {
            return (LHSprite*)spr;
        }
    }
    return nil;
}
////////////////////////////////////////////////////////////////////////////////
-(LHSprite*)spriteB{
#ifndef LH_ARC_ENABLED
    id spr = (id)bodyB->GetUserData();
#else
    id spr = (__bridge id)bodyB->GetUserData();
#endif
    if(nil != spr)
    {
        if([LHSprite isLHSprite:spr])
        {
            return (LHSprite*)spr;
        }
    }
    return nil;    
}

-(LHBezierNode*)bezierA{

#ifndef LH_ARC_ENABLED
    id spr = (id)bodyA->GetUserData();
#else
    id spr = (__bridge id)bodyA->GetUserData();
#endif
    if(nil != spr)
    {
        if([LHBezierNode isLHBezierNode:spr])
        {
            return (LHBezierNode*)spr;
        }
    }
    return nil;    

}
-(LHBezierNode*)bezierB{
    
#ifndef LH_ARC_ENABLED
    id spr = (id)bodyB->GetUserData();
#else
    id spr = (__bridge id)bodyB->GetUserData();
#endif
    if(nil != spr)
    {
        if([LHBezierNode isLHBezierNode:spr])
        {
            return (LHBezierNode*)spr;
        }
    }
    return nil;    
}

////////////////////////////////////////////////////////////////////////////////
-(b2Contact*)contact{
    return contact;
}
////////////////////////////////////////////////////////////////////////////////
-(const b2Manifold*)oldManifold{
    return oldManifold;
}
////////////////////////////////////////////////////////////////////////////////
-(const b2ContactImpulse*)impulse{
    return impulse;
}
////////////////////////////////////////////////////////////////////////////////
@end
