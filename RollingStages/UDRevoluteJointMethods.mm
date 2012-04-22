//
//  UDRevoluteJointMethods.m
//  RollingStages
//
//  Created by Amol Chaudhari on 2/20/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "UDRevoluteJointMethods.h"

@implementation UDRevoluteJointMethods

+(void)motorJoint:(LevelHelperLoader *)_lhelper jointName:(NSString*)jointName
   withUpperLimit:(float)upperLimit andLowerLimit:(float)lowerLimit 
{
    
    // get joints
    LHJoint *revoluteJoint3 = [_lhelper jointWithUniqueName:jointName];
    
    b2RevoluteJoint *revoluteJoint3Def = (b2RevoluteJoint*) revoluteJoint3.joint;
    
  //  NSLog(@"revolute joint %f", revoluteJoint3Def->GetBodyB()->GetAngle() );
    
    float32 bodyAngle =   revoluteJoint3Def->GetBodyB()->GetAngle();
    
    if (bodyAngle >upperLimit ) {  //0.5
        revoluteJoint3Def->SetMotorSpeed(-15.0);
      //  NSLog(@"I m in");
    }
    else if(bodyAngle < lowerLimit) //0.1
    {
        revoluteJoint3Def->SetMotorSpeed(15.0);
      //  NSLog(@"I m not in");
        
    }  
    
    
    
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}






@end
