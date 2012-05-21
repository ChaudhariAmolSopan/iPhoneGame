//
//  UDRevoluteJointMethods.h
//  RollingStages
//
//  Created by Amol Chaudhari on 2/20/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevelHelperLoader.h"

@interface UDRevoluteJointMethods : NSObject
{
    
}
+(void)motorJoint:(LevelHelperLoader *)_lhelper jointName:(NSString*)jointName
   withUpperLimit:(float)upperLimit andLowerLimit:(float)lowerLimit; 
@end
