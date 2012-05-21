//
//  ScoringSystem.m
//  RollingStages
//
//  Created by Richard Wang on 5/8/12.
//  Copyright (c) 2012 nyu-poly. All rights reserved.
//

#import "ScoringSystem.h"

@implementation ScoringSystem

-(id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        score = 0;
    }
    
    return self;
}
-(int)getScore
{
    return score;
}
-(void)updateScore: (NSString*) objType
{
NSDictionary *dict;

// read "foo.plist" from application bundle
NSString *path = [[NSBundle mainBundle] bundlePath];
NSString *finalPath = [path stringByAppendingPathComponent:@"Items.plist"];
dict = [NSDictionary dictionaryWithContentsOfFile:finalPath];

    
    NSNumber *scoreDelta = [dict objectForKey:objType];
    
    
score = score + scoreDelta.intValue;
    if (score < 0)
    {
        score = 0;
    }

}

@end
