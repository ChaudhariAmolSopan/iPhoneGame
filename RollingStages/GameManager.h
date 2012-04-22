//
//  GameManager.h
//  RollingStages
//
//  Created by Amol Chaudhari on 1/11/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface GameManager : NSObject
{
    SceneTypes currentScene;
}
@property(readwrite)BOOL hasPlayerDied;

+(GameManager*)sharedGameManager;
-(void)runSceneWithID:(SceneTypes)sceneID;


@end
