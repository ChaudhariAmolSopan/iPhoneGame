//
//  ActionLayerScene2.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/27/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "ActionLayerScene2.h"

@implementation ActionLayerScene2




- (id)init
{
    self = [super initWithPlayerSpriteName:@"skull" stageFileName:@"SecondStage"];
    
    if (self) {
        // Initialization code here.
        
     
        
        
        
    }
    
    return self;
}

+(id)scene
{
    CCScene *scene = [CCScene node];
    
    ActionLayerScene2 *layer = [ActionLayerScene2 node];
    [scene addChild:layer];
    
    return scene;
}


-(void)UDRevoluteJointsMethodsImplementation
{
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"FirstRevoluteJoint" withUpperLimit:15 andLowerLimit:-15];  //0.1 0.5
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"SecondRevoluteJoint" withUpperLimit:10 andLowerLimit:-5];
}





@end
