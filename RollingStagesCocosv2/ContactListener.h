 //
//  ContactListener.h
//  RollingStages
//
//  Created by Amol Chaudhari on 12/20/11.
//  Copyright 2011 nyu-poly. All rights reserved.
//


#import "ContactListener.h"
#import "Box2D.h"
#import "b2Contact.h"

class ContactListener : public b2ContactListener
{
public:
	ContactListener();
    
	void* userData; /// Use this to store application specific body data.
	void BeginContact(b2Contact* contact);
	void EndContact(b2Contact* contact);
};