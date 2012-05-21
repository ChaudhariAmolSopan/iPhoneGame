//  This file was generated by LevelHelper
//  http://www.levelhelper.org
//
//  LevelHelperLoader.h
//  Created by Bogdan Vladu
//  Copyright 2011 Bogdan Vladu. All rights reserved.
//
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

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#include "Box2D.h"

@class LHSprite;
@interface LHPathNode : CCNode
{
	LHSprite* ccsprite; //week ptr
	b2Body* body; //week ptr
    NSString* uniqueName; //week ptr
	NSMutableArray* pathPoints; //week ptr
    
	float speed;
	double interval;
	bool startAtEndPoint;
	bool isCyclic;
	bool restartOtherEnd;
	int axisOrientation; //0 NO ORIENTATION 1 X 2 Y
    bool flipX;
    bool flipY;
    
	int currentPoint;
	double elapsed;

	bool paused;
	float initialAngle;
    CGPoint prevPathPosition;
	double time;
	bool isLine;
	
    id pathNotifierId;
    SEL pathNotifierSel;
}
@property (readwrite) bool	isCyclic;
@property (readwrite) bool	restartOtherEnd;
@property (readwrite) int	axisOrientation;
@property (readwrite) bool	paused;
@property (readwrite) bool	isLine;
@property (readwrite) bool  flipX;
@property (readwrite) bool  flipY;

-(id) initPathWithPoints:(NSMutableArray*)points;
+(id) nodePathWithPoints:(NSMutableArray*)points;;

-(void) setUniqueName:(NSString*)name;
-(void) setSprite:(LHSprite*)spr;
-(LHSprite*)sprite;
-(void) setBody:(b2Body*)bd;

-(void) setSpeed:(float)value;
-(float) speed;

-(void) setStartAtEndPoint:(bool)val;
-(bool) startAtEndPoint;

-(void) setPathNotifierObject:(id)object;
-(void) setPathNotifierSelector:(SEL)selector;
@end	
