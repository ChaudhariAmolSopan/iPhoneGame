//
//  GameManager.m
//  RollingStages
//
//  Created by Amol Chaudhari on 1/11/12.
//  Copyright 2012 nyu-poly. All rights reserved.
//

#import "GameManager.h"
#import "GameScene.h"

#import "MainMenuScene.h"
#import "OptionsScene.h"
#import "ActionLayerScene4.h"
#import "LevelSelectLayer.h"

@implementation GameManager
@synthesize hasPlayerDied,hasPlayerWon;
static GameManager* _sharedGameManager = nil;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        hasPlayerWon=NO;
    }
    
    return self;
}



+(GameManager*)sharedGameManager
{
    @synchronized([GameManager class])
    {
        if (!_sharedGameManager) 
        {
            [[self alloc]init];
        }
        return _sharedGameManager;
        
    }
    return nil;
}

+(id)alloc
{
    @synchronized ([GameManager class])
    {
        NSAssert(_sharedGameManager == nil,
                 @"Attempted to allocate a second instance of the Game Manager singleton");
        _sharedGameManager = [super alloc];
        return _sharedGameManager;
    }
    return nil;
}

-(void)runSceneWithID:(SceneTypes)sceneID
{
 
    SceneTypes oldScene = currentScene;
    currentScene=sceneID;
    id sceneToRun=nil;
    
    switch (sceneID) {
        case kMainMenuScene:
            sceneToRun = [MainMenuScene node];
            break;
            
        case kOptionsScene:
            sceneToRun=[OptionsScene node];
            break;
            
        case kCreditsScene:
         //   sceneToRun=[CreditsScene node];
            break;
            
        case kIntroScene:
          //  sceneToRun=[IntroScene node];
            break;
            
        case kLevelSelectScene:
            sceneToRun=[LevelSelectLayer scene];
            break;
            
        case kLevelCompleteScene:
           // sceneToRun=[LevelCompleteScene node];
            break;
            
        case kGameLevel1:
            sceneToRun=[GameScene node];            //Runs Stage1
            break;
            
        case kGameLevel2: 
            // Placeholder for Level 2 break;
            break;
            
        case kGameLevel3: 
            
           // sceneToRun = [PuzzleLayer node];
            break;
            
        case kGameLevel4:
            // Placeholder for Level 4 break;
            sceneToRun=[ActionLayerScene4 scene];
            break;
        case kGameLevel5: 
            // Placeholder for Level 5 break;
            
            break;
        case kCutSceneForLevel2: 
            // Placeholder for Platform Level break;
            
            break;
        default:
            CCLOG(@"Unknown id cannot switch scene");
            break;
    }

    if (sceneToRun == nil) {
        //revert back since now new scene was found
        
        currentScene = oldScene;
        return;
    }

    //Menu scenes have a value of less than 100
    
    if (sceneID<100) {
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
            CGSize screenSize = [CCDirector sharedDirector].winSizeInPixels;
            
            if (screenSize.width == 960.0f) {
                //iphone 4 retina
                [sceneToRun setScaleX:0.9375f];
                [sceneToRun setScaleY:0.8333f];
                
                CCLOG(@"Scaling for iphone 4 (retina)");
            }
            else
            {
                [sceneToRun setScaleX:0.4688f];
                [sceneToRun setScaleY:0.4166f];
                CCLOG(@"GM:Scaling for iphone 3G(non-retina)");
            }
        }
    }
    
    if ([[CCDirectorIOS sharedDirector]runningScene] == nil) {
        [[CCDirectorIOS sharedDirector] runWithScene:sceneToRun];
    }
    else
    {
        [[CCDirectorIOS sharedDirector]replaceScene:sceneToRun];
    }

    
    
}


@end
