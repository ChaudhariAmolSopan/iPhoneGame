//
//  ActionLayerScene3.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/27/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "ActionLayerScene3.h"

@implementation ActionLayerScene3

- (id)init
{
    self = [super initWithPlayerSpriteName:@"skull" stageFileName:@"ThirdStage"];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+(id)scene
{
    CCScene *scene = [CCScene node];
    
    ActionLayerScene3 *layer = [ActionLayerScene3 node];
    [scene addChild:layer];
    
    return scene;
}

-(void)UDRevoluteJointsMethodsImplementation
{
    [UDRevoluteJointMethods motorJoint:_lhelper jointName:@"FirstRevoluteJoint" withUpperLimit:15 andLowerLimit:-15];  //0.1 0.5

}




@end
