//
//  ActionLayerScene4.m
//  RollingStagesCocosv2
//
//  Created by Richard Wang on 5/13/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import "ActionLayerScene4.h"
#import "DatabaseCalls.h"
@implementation ActionLayerScene4
- (id)init
{
    self = [super initWithPlayerSpriteName:@"skull" stageFileName:@"FirstStage"];
    if (self) {
        // Initialization code here.
        
        //Just database test stuff;
        DatabaseCalls *databaseCalls = [[DatabaseCalls alloc]init];
        [databaseCalls insertPlayer:@"Amol" levelName:@"FourthLevel" score:@"1000"];
        
        
    }
    
    return self;
}

+(id)scene
{
    CCScene *scene = [CCScene node];
    
    ActionLayerScene4 *layer = [ActionLayerScene4 node];
    [scene addChild:layer];
    
    return scene;
}

-(void)UDRevoluteJointsMethodsImplementation
{
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"ThirdRevoluteJoint" withUpperLimit:15 andLowerLimit:-15];  //0.1 0.5
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"SecondRevoluteJoint" withUpperLimit:10 andLowerLimit:-5];
    
    
}

- (void)dealloc {
    [_lhelper release];
    // [emitter release];
    _lhelper = nil;
    delete _world;
    [super dealloc];
}

@end
