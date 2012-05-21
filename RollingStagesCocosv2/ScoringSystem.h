//
//  ScoringSystem.h
//  RollingStages
//
//  Created by Richard Wang on 5/8/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoringSystem : NSObject
{
    int score;
}
-(int)getScore;

-(void)updateScore: (NSString*) objType;
    




/*
 
 */


@end
